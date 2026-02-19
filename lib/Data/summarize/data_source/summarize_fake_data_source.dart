import 'dart:io';

class SummarizeFakeDataSource {
  Future<String> summarize(File file) async {
    await Future.delayed(const Duration(seconds: 2));

    return '''
📄 File: ${file.path.split('/').last}

🧠 This is a fake AI-generated summary
for testing purposes only.
''';
  }
}
