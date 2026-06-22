import 'package:flutter/material.dart';
import '../../../domain/export/export_type.dart';
import '../../../l10n/app_localizations.dart';

class ExportDialog extends StatefulWidget {

  final Function(
      ExportType type,
      String fileName,
      ) onExport;

  const ExportDialog({super.key, required this.onExport});

  @override
  State<ExportDialog> createState() => _ExportDialogState();
}

class _ExportDialogState extends State<ExportDialog> {

  ExportType type = ExportType.pdf;

  final nameController = TextEditingController(
    text: "summary",
  );

  String directory = "/storage/emulated/0/Download";

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      title: Text(AppLocalizations.of(context)!.exportSummary),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "File name",
            ),
          ),

          const SizedBox(height: 20),

          DropdownButton<ExportType>(
            value: type,
            items: [

              DropdownMenuItem(
                value: ExportType.pdf,
                child: Text(AppLocalizations.of(context)!.pdf),
              ),

              DropdownMenuItem(
                value: ExportType.txt,
                child: Text(AppLocalizations.of(context)!.txt),
              ),

            ],
            onChanged: (value) {

              setState(() {
                type = value!;
              });

            },
          ),

        ],
      ),

      actions: [

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),

        ElevatedButton(
          onPressed: () {

            widget.onExport(
              type,
              nameController.text,
              // directory,
            );

            Navigator.pop(context);

          },
          child: Text(AppLocalizations.of(context)!.export),
        )

      ],

    );

  }

}