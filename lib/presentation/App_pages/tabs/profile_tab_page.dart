import 'package:flutter/material.dart';

import '../../profile/view/profile_view.dart';

class ProfileTabPage extends StatelessWidget {
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileView(),
      ),
    );
  }
}