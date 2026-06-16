import 'package:flutter/material.dart';

import '../../history/views/history_view.dart';

class HistoryTabPage extends StatelessWidget {
  const HistoryTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HistoryView(); // ✅ يستخدم نفس Cubit من main
  }
}