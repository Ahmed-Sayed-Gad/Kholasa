import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/file_share_service.dart';
import '../../../../core/theme/color_manager.dart';
import '../../export/cubit/export_cubit.dart';
import '../../export/cubit/export_state.dart';
import '../../widget/export_dialog.dart';
import '../../../../core/di/di.dart';
import '../../chat/cubit/chat_cubit.dart';
import '../../chat/views/chat_view.dart';

class SummarizeResult extends StatelessWidget {
  final String summary;
  final String fileTitle;
  final bool showChatFAB;

  const SummarizeResult({
    super.key,
    required this.summary,
    required this.fileTitle,
    this.showChatFAB = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportCubit, ExportState>(
      listener: (context, state) {
        if (state is ExportSuccess) {
          showModalBottomSheet(
            context: context,
            backgroundColor: Theme.of(context).cardColor,
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.open_in_new,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Open file",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    onTap: () async {
                      await FileShareService()
                          .openFile(state.file.path);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Share file",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    onTap: () async {
                      await FileShareService()
                          .shareFile(state.file.path);
                    },
                  ),
                ],
              );
            },
          );
        }

        if (state is ExportError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(.15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor
                                  .withOpacity(.10),
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                            child: Icon(
                              Icons.description_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 28,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AI Summary",
                                  style: TextStyle(
                                    color:
                                    Theme.of(context).textTheme.bodyLarge?.color,
                                    fontSize: 18,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Generated just now",
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor
                                  .withOpacity(.10),
                              borderRadius:
                              BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize:
                              MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 16,
                                  color:
                                  Theme.of(context).primaryColor,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "English",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      SelectableText(
                        summary,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 14,
                          height: 1.9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(
                        padding:
                        const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor
                              .withOpacity(.08),
                          borderRadius:
                          BorderRadius.circular(18),
                          border: Border.all(
                            color: Theme.of(context).primaryColor
                                .withOpacity(.15),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color:
                              Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "This summary was generated using AI. Please verify important information.",
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                        const Size.fromHeight(56),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return ExportDialog(
                              onExport:
                                  (type, name) {
                                context
                                    .read<ExportCubit>()
                                    .exportSummary(
                                  summary: summary,
                                  type: type,
                                  fileName: name,
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.picture_as_pdf,
                      ),
                      label: const Text(
                        "Export PDF",
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                        const Size.fromHeight(56),
                        backgroundColor:
                        ColorManager.successBg,
                        foregroundColor:
                        ColorManager.success,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return ExportDialog(
                              onExport:
                                  (type, name) {
                                context
                                    .read<ExportCubit>()
                                    .exportSummary(
                                  summary: summary,
                                  type: type,
                                  fileName: name
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.text_snippet,
                      ),
                      label: const Text(
                        "Export TXT",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: showChatFAB ? Padding(
          padding: const EdgeInsets.only(bottom: 72.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.35),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => getIt<ChatCubit>()..selectDocumentByTitle(fileTitle),
                      child: const ChatView(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.chat_outlined),
            ),
          ),
        ) : null,
      ),
    );
  }
}