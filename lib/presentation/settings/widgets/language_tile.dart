import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../language/cubit/language_cubit.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text("Language"),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("English"),
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage('en');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("العربية"),
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage('ar');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}