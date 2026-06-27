import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:project_one_c3_team/l10n/app_localizations.dart';
import '../../../domain/history/entities/history_item.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatView extends StatefulWidget {
  final bool showHeader;
  final bool showDocumentSelector;

  const ChatView({
    super.key,
    this.showHeader = true,
    this.showDocumentSelector = true,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (!scrollController.hasClients) return;

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _send() {
    final text = controller.text.trim();

    if (text.isEmpty) return;

    context.read<ChatCubit>().sendMessage(text);

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (_, __) {
            _scrollToBottom();
          },
          builder: (context, state) {
            return Column(
              children: [
                if (widget.showHeader) const _Header(),
                if (state is ChatLoaded) ...[
                  if (widget.showDocumentSelector)
                    _DocumentSelector(
                      historyItems: state.historyItems,
                      selectedDocument: state.selectedDocument,
                    ),
                  Expanded(
                    child: state.selectedDocument == null
                        ? const _NoDocumentSelected()
                        : Column(
                            children: [
                              const _SelectedDocumentBanner(),
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  itemCount: state.messages.length + (state.isTyping ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    if (index == state.messages.length) {
                                      return const _TypingBubble();
                                    }

                                    final message = state.messages[index];

                                    return _MessageBubble(
                                      text: message.text,
                                      isUser: message.isUser,
                                      createdAt: message.createdAt,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                  if (state.selectedDocument != null)
                    _InputBar(
                      controller: controller,
                      onSend: _send,
                      hintText: '${l10n.askQuestionAbout} "${state.selectedDocument!.title}"...',
                    ),
                ] else if (state is ChatError) ...[
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.chat_bubble_outline,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.chatAssistant,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Ask questions, verify details, and discuss key insights of any summarized document in your library.',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentSelector extends StatelessWidget {
  final List<HistoryItem> historyItems;
  final HistoryItem? selectedDocument;

  const _DocumentSelector({
    required this.historyItems,
    required this.selectedDocument,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description_outlined,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.selectDocToChat,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedDocument?.id,
                hint: Text(
                  l10n.selectDocFromLibrary,
                  style: TextStyle(color: Theme.of(context).hintColor, fontSize: 14),
                ),
                isExpanded: true,
                dropdownColor: Theme.of(context).cardColor,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).hintColor,
                ),
                selectedItemBuilder: (BuildContext context) {
                  return historyItems.map<Widget>((HistoryItem item) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList();
                },
                items: historyItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.id,
                    child: Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          color: Theme.of(context).hintColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (id) {
                  if (id == null) return;
                  final selected = historyItems.firstWhere((item) => item.id == id);
                  context.read<ChatCubit>().selectDocument(selected);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoDocumentSelected extends StatelessWidget {
  const _NoDocumentSelected();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.08),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.noDocSelected,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.noDocSelectedDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedDocumentBanner extends StatelessWidget {
  const _SelectedDocumentBanner();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff12A8FF).withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xff12A8FF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lightbulb_outline,
            color: Color(0xff12A8FF),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.answersBasedOnDoc,
              style: const TextStyle(
                color: Color(0xff12A8FF),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final DateTime createdAt;

  const _MessageBubble({
    required this.text,
    required this.isUser,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;
    final color = isUser ? Theme.of(context).primaryColor : Theme.of(context).cardColor;
    final textColor = isUser ? Colors.black : Theme.of(context).textTheme.bodyLarge?.color;
    final timeStr = "${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}";

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isUser) ...[
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).dividerColor),
                    ),
                    child: Icon(
                      Icons.smart_toy_outlined,
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(18),
                    border: isUser ? null : Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: isUser
                      ? Text(
                          text,
                          style: TextStyle(
                            color: textColor,
                            height: 1.5,
                            fontSize: 15,
                          ),
                        )
                      : MarkdownBody(
                          data: text,
                          selectable: true,
                          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                            p: TextStyle(
                              color: textColor,
                              height: 1.5,
                              fontSize: 15,
                            ),
                            listBullet: TextStyle(
                              color: textColor,
                              fontSize: 15,
                            ),
                            strong: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: isUser ? 0 : 44, right: isUser ? 8 : 0, top: 4),
              child: Text(
                timeStr,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Text(
          l10n.typing,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final String hintText;

  const _InputBar({
    required this.controller,
    required this.onSend,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 16),
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onSend,
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.send,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}