import 'package:flutter/material.dart';
import '../../../domain/export/export_type.dart';

class ExportDialog extends StatefulWidget {

  final Function(
      ExportType type,
      String fileName,
      String directory,
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

      title: const Text("Export Summary"),

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
            items: const [

              DropdownMenuItem(
                value: ExportType.pdf,
                child: Text("PDF"),
              ),

              DropdownMenuItem(
                value: ExportType.txt,
                child: Text("TXT"),
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
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: () {

            widget.onExport(
              type,
              nameController.text,
              directory,
            );

            Navigator.pop(context);

          },
          child: const Text("Export"),
        )

      ],

    );

  }

}