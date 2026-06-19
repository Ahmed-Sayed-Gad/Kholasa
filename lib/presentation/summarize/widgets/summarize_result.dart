import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/file_share_service.dart';
import '../../../../core/theme/color_manager.dart';
import '../../export/cubit/export_cubit.dart';
import '../../export/cubit/export_state.dart';
import '../../widget/export_dialog.dart';

class SummarizeResult extends StatelessWidget {
  final String summary;

  const SummarizeResult({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportCubit, ExportState>(
      listener: (context, state) {
        if (state is ExportSuccess) {
          showModalBottomSheet(
            context: context,
            backgroundColor: ColorManager.secondaryDark,
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.open_in_new,
                      color: ColorManager.primary,
                    ),
                    title: const Text(
                      "Open file",
                      style: TextStyle(
                        color: ColorManager.textColor,
                      ),
                    ),
                    onTap: () async {
                      await FileShareService()
                          .openFile(state.file.path);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.share,
                      color: ColorManager.primary,
                    ),
                    title: const Text(
                      "Share file",
                      style: TextStyle(
                        color: ColorManager.textColor,
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
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorManager.secondaryDark,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: ColorManager.primary.withOpacity(.15),
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
                            color: ColorManager.primary
                                .withOpacity(.10),
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.description_outlined,
                            color: ColorManager.primary,
                            size: 28,
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AI Summary",
                                style: TextStyle(
                                  color:
                                  ColorManager.textColor,
                                  fontSize: 22,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Generated just now",
                                style: TextStyle(
                                  color: ColorManager
                                      .hintTextColor,
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
                            color: ColorManager.primary
                                .withOpacity(.10),
                            borderRadius:
                            BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize:
                            MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.language,
                                size: 16,
                                color:
                                ColorManager.primary,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "English",
                                style: TextStyle(
                                  color: ColorManager
                                      .primary,
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
                      style: const TextStyle(
                        color: ColorManager.textColor,
                        fontSize: 17,
                        height: 1.9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding:
                      const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorManager.primary
                            .withOpacity(.08),
                        borderRadius:
                        BorderRadius.circular(18),
                        border: Border.all(
                          color: ColorManager.primary
                              .withOpacity(.15),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color:
                            ColorManager.primary,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "This summary was generated using AI. Please verify important information.",
                              style: TextStyle(
                                color: ColorManager
                                    .textColorSecondary,
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
                      side: const BorderSide(
                        color: ColorManager.primaryBlue,
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
    );
  }
}