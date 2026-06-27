import 'package:flutter/material.dart';
import 'package:project_one_c3_team/presentation/App_pages/tabs/saved_tab_page.dart';
import 'tabs/home_tab_page.dart';
import 'tabs/history_tab_page.dart';
import 'tabs/profile_tab_page.dart';
import '../../../l10n/app_localizations.dart';

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  static final ValueNotifier<int> tabNotifier = ValueNotifier<int>(0);

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  final pages = const [
    HomeTabPage(),
    HistoryTabPage(),
    SavedTabPage(),
    ProfileTabPage(),
  ];

  @override
  void initState() {
    super.initState();
    HomeShellPage.tabNotifier.value = 0;
    HomeShellPage.tabNotifier.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (mounted) {
      setState(() {
        _currentIndex = HomeShellPage.tabNotifier.value;
      });
    }
  }

  @override
  void dispose() {
    HomeShellPage.tabNotifier.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => HomeShellPage.tabNotifier.value = i,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppLocalizations.of(context)!.home),
          BottomNavigationBarItem(icon: const Icon(Icons.history), label: AppLocalizations.of(context)!.history),
          BottomNavigationBarItem(icon: const Icon(Icons.bookmark), label: AppLocalizations.of(context)!.saved),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: AppLocalizations.of(context)!.profile),
        ],
      ),
    );
  }
}
