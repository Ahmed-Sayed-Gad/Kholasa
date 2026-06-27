import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one_c3_team/presentation/settings/views/privacy_policy_view.dart';
import 'package:project_one_c3_team/presentation/settings/views/terms_of_use_view.dart';

import '../../../core/di/di.dart';
import '../../../core/services/user_storage.dart';
import '../../../core/theme/color_manager.dart';

import '../../../l10n/app_localizations.dart';

import '../../auth/views/login_view.dart';
import '../../language/cubit/language_cubit.dart';

import '../../widget/reduced_font_theme.dart';
import '../../theme/theme_cubit.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';
import '../widgets/language_tile.dart';
import '../../auth/cubit/logout_cubit.dart';
import '../../auth/cubit/logout_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SettingsCubit>()..load()),
        BlocProvider(create: (_) => getIt<LogoutCubit>()),
      ],
      child: const _SettingsBody(),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ReducedFontTheme(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            locale.settings,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold,
              fontSize: 31,
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
                  locale.managePreferences,
                  style: TextStyle(color: Theme.of(context).hintColor, fontSize: 17),
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
                        backgroundColor: Theme.of(context).primaryColor,
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
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      subtitle: Text(
                        email,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),

                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).hintColor,
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
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        locale.languagePreference,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      subtitle: Text(
                        data.language.toUpperCase(),
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      trailing: DropdownButton<String>(
                        dropdownColor: Theme.of(context).cardColor,
                        value: data.language,
                        underline: const SizedBox(),
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                        items: [
                          DropdownMenuItem(value: "en", child: Text(locale.english)),
                          DropdownMenuItem(value: "ar", child: Text(locale.arabic)),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            context.read<SettingsCubit>().changeLanguage(value);

                            context.read<LanguageCubit>().changeLanguage(value);
                          }
                        },
                      ),
                    ),

                    Divider(color: Theme.of(context).dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(Icons.save, color: Theme.of(context).primaryColor),
                      title: Text(
                        locale.autoSave,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      subtitle: Text(
                        locale.autoSaveDesc,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      activeThumbColor: Theme.of(context).primaryColor,
                      value: data.autoSaveEnabled,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleAutoSave(value);
                      },
                    ),

                    Divider(color: Theme.of(context).dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(
                        Icons.notifications,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        locale.notifications,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      subtitle: Text(
                        locale.notificationsDesc,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      activeThumbColor: Theme.of(context).primaryColor,
                      value: data.notificationsEnabled,
                      onChanged: (value) {
                        context.read<SettingsCubit>().toggleNotifications(
                          value,
                        );
                      },
                    ),

                    Divider(color: Theme.of(context).dividerColor, height: 1),

                    SwitchListTile(
                      secondary: Icon(
                        Icons.dark_mode,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        locale.darkMode,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      subtitle: Text(
                        locale.darkModeDesc,
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      activeThumbColor: Theme.of(context).primaryColor,

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
              _SectionTitle(locale.privacySecurity),
              const SizedBox(height: 12),

              _Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.shield, color: ColorManager.success),
                      title: Text(
                        locale.privacyPolicy,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).hintColor,
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

                    Divider(color: Theme.of(context).dividerColor, height: 1),

                    ListTile(
                      leading: const Icon(Icons.gavel, color: ColorManager.success),
                      title: Text(
                        locale.terms,
                        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).hintColor,
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
              BlocConsumer<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state is LogoutSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginView()),
                      (route) => false,
                    );
                  }
                  if (state is LogoutError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is LogoutLoading;
                  return _Card(
                    child: ListTile(
                      leading: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
                      title: Text(
                        locale.logout,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: isLoading
                          ? null
                          : () async {
                              final result = await showDialog<bool>(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(locale.logout),
                                  content: const Text(
                                    "Are you sure you want to sign out?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: Text(locale.cancel),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: Text(locale.logout),
                                    ),
                                  ],
                                ),
                              );

                              if (result != true) return;

                              if (!context.mounted) return;
                              context.read<LogoutCubit>().logout();
                            },
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              const LanguageTile(),
            ],
          );
        },
      ),
    ),);
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
        color: Theme.of(context).hintColor,
        fontSize: 15,
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
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: child,
    );
  }
}
