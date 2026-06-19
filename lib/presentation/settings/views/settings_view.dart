import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one_c3_team/presentation/settings/views/privacy_policy_view.dart';
import 'package:project_one_c3_team/presentation/settings/views/terms_of_use_view.dart';

import '../../../core/di/di.dart';
import '../../../core/services/auth_storage.dart';
import '../../../core/services/user_storage.dart';
import '../../../core/theme/color_manager.dart';

import '../../../l10n/app_localizations.dart';

import '../../auth/views/login_view.dart';
import '../../language/cubit/language_cubit.dart';

import '../../theme/theme_cubit.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';
import '../widgets/language_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>()..load(),
      child: const _SettingsBody(),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          locale.settings,
          style: TextStyle(
            color: ColorManager.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),

      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state.status == SettingsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = state.settings;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                "Manage your preferences",
                style: TextStyle(color: ColorManager.textHint, fontSize: 14),
              ),

              const SizedBox(height: 24),

              /// ACCOUNT
              Text(locale.account),
              const SizedBox(height: 12),

              FutureBuilder(
                future: Future.wait([
                  UserStorage.getName(),
                  UserStorage.getEmail(),
                ]),
                builder: (context, snapshot) {
                  final name = snapshot.hasData
                      ? snapshot.data![0] ?? "User"
                      : "User";

                  final email = snapshot.hasData ? snapshot.data![1] ?? "" : "";

                  return _Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: ColorManager.primary,
                        child: Text(
                          name.isNotEmpty ? name[0].toUpperCase() : "U",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      title: Text(
                        name,
                        style: const TextStyle(
                          color: ColorManager.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      subtitle: Text(
                        email,
                        style: const TextStyle(color: ColorManager.textHint),
                      ),

                      trailing: Icon(
                        Icons.chevron_right,
                        color: ColorManager.textHint,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// PREFERENCES
              Text(locale.preferences),
              const SizedBox(height: 12),

              _Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: ColorManager.primary,
                      ),
                      title: Text(
                        "Language Preference",
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      subtitle: Text(
                        data.language.toUpperCase(),
                        style: TextStyle(color: ColorManager.textHint),
                      ),
                      trailing: DropdownButton<String>(
                        dropdownColor: ColorManager.cardBackground,
                        value: data.language,
                        underline: const SizedBox(),
                        style: TextStyle(color: ColorManager.textPrimary),
                        items: const [
                          DropdownMenuItem(value: "en", child: Text("EN")),
                          DropdownMenuItem(value: "ar", child: Text("AR")),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            context.read<SettingsCubit>().changeLanguage(value);

                            context.read<LanguageCubit>().changeLanguage(value);
                          }
                        },
                      ),
                    ),

                    Divider(color: ColorManager.dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(Icons.save, color: ColorManager.primary),
                      title: Text(
                        "Auto-save Summaries",
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      subtitle: Text(
                        "Automatically save all summaries",
                        style: TextStyle(color: ColorManager.textHint),
                      ),
                      activeColor: ColorManager.primary,
                      value: data.autoSaveEnabled,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleAutoSave(value);
                      },
                    ),

                    Divider(color: ColorManager.dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(
                        Icons.notifications,
                        color: ColorManager.primary,
                      ),
                      title: Text(
                        "Push Notifications",
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      subtitle: Text(
                        "Get notified when summaries are ready",
                        style: TextStyle(color: ColorManager.textHint),
                      ),
                      activeColor: ColorManager.primary,
                      value: data.notificationsEnabled,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleNotifications(
                          value,
                        );
                      },
                    ),

                    Divider(color: ColorManager.dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(
                        Icons.dark_mode,
                        color: ColorManager.primary,
                      ),
                      title: Text(
                        locale.darkMode,
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      subtitle: Text(
                        "Use dark theme",
                        style: TextStyle(color: ColorManager.textHint),
                      ),
                      activeColor: ColorManager.primary,

                      value:
                          context.watch<ThemeCubit>().state.mode ==
                          ThemeMode.dark,

                      onChanged: (value) {
                        context.read<ThemeCubit>().setTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );

                        context.read<SettingsCubit>().toggleTheme(
                          context,
                          value,
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// PRIVACY
              _SectionTitle("PRIVACY & SECURITY"),
              const SizedBox(height: 12),

              _Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.shield, color: ColorManager.success),
                      title: Text(
                        "Privacy Policy",
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: ColorManager.textHint,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PrivacyPolicyView(),
                          ),
                        );
                      },
                    ),

                    Divider(color: ColorManager.dividerColor, height: 1),

                    ListTile(
                      leading: Icon(Icons.gavel, color: ColorManager.success),
                      title: Text(
                        "Terms of Service",
                        style: TextStyle(color: ColorManager.textPrimary),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: ColorManager.textHint,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TermsOfUseView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// SIGN OUT
              _Card(
                child: ListTile(
                  leading: Icon(Icons.logout, color: ColorManager.error),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: ColorManager.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Sign Out"),
                        content: const Text(
                          "Are you sure you want to sign out?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text("Sign Out"),
                          ),
                        ],
                      ),
                    );

                    if (result != true) return;

                    await UserStorage.clear();
                    await AuthStorage.logout();

                    if (!context.mounted) return;

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginView()),
                      (route) => false,
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              const LanguageTile(),
            ],
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: ColorManager.textHint,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.dividerColor),
      ),
      child: child,
    );
  }
}
