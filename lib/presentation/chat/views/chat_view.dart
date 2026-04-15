import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';

import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

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
    return Scaffold(
      backgroundColor: ColorManager.primaryDark,

      body: SafeArea(
        child: Column(
          children: [
            const _Header(),

            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (_, __) {
                  _scrollToBottom();
                },
                builder: (context, state) {
                  if (state is ChatLoaded) {
                    return ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount:
                      state.messages.length +
                          (state.isTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.messages.length) {
                          return const _TypingBubble();
                        }

                        final message = state.messages[index];

                        return _MessageBubble(
                          text: message.text,
                          isUser: message.isUser,
                        );
                      },
                    );
                  }

                  if (state is ChatError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),

            _InputBar(
              controller: controller,
              onSend: _send,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      decoration: BoxDecoration(
        color: ColorManager.secondaryDark,
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(.05),
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: ColorManager.primaryDark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Online now',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff12A8FF),
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
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

  const _MessageBubble({
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
    isUser ? Alignment.centerRight : Alignment.centerLeft;

    final color = isUser
        ? ColorManager.primary
        : ColorManager.secondaryDark;

    final textColor =
    isUser ? Colors.black : Colors.white;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(maxWidth: 290),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            height: 1.5,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: ColorManager.secondaryDark,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Text(
          'Typing...',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 16),
      color: ColorManager.secondaryDark,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: const TextStyle(
                  color: Colors.white54,
                ),
                filled: true,
                fillColor: ColorManager.primaryDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                const EdgeInsets.symmetric(
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
              width: 52,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}