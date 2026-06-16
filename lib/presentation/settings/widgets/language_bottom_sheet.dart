import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../language/cubit/language_cubit.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            const Text(
              'Choose Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("English"),
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('en');
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("العربية"),
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('ar');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
