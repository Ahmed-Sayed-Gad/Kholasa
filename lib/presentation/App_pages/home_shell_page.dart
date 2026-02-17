import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';
import '../home/cubit/home_cubit.dart';
import 'tabs/home_tab_page.dart';
import 'tabs/upload_tab_page.dart';
import 'tabs/billing_tab_page.dart';
import 'tabs/pdf_tab_page.dart';
import 'tabs/settings_tab_page.dart';

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  final pages = const [
    HomeTabPage(),
    UploadTabPage(),
    BillingTabPage(),
    PdfTabPage(),
    SettingsTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Billing"),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: "PDF"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

