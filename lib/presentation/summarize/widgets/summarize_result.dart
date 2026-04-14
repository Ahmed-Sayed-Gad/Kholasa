import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/export/export_type.dart';
import '../../../../core/services/file_share_service.dart';
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
            builder: (_) {

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  ListTile(
                    leading: const Icon(Icons.open_in_new),
                    title: const Text("Open file"),
                    onTap: () async {

                      await FileShareService()
                          .openFile(state.file.path);

                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text("Share file"),
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
            SnackBar(content: Text(state.message)),
          );

        }

      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(summary),

          const SizedBox(height: 20),

          Row(
            children: [

              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {

                      return ExportDialog(

                        onExport: (type, name, directory) {

                          context.read<ExportCubit>().exportSummary(
                            summary: summary,
                            type: type,
                            fileName: name,
                            directory: directory,
                          );

                        },

                      );

                    },
                  );

                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text("Export PDF"),
              ),

              const SizedBox(width: 10),

              ElevatedButton.icon(
                onPressed: () {


                },
                icon: const Icon(Icons.text_snippet),
                label: const Text("Export TXT"),
              ),

            ],
          ),

        ],
      ),
    );
  }
}