// lib/presentation/App_pages/tabs/profile_tab_page.dart

import 'package:flutter/material.dart';

import '../../settings/views/settings_view.dart';

class ProfileTabPage
    extends StatelessWidget {
  const ProfileTabPage({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
          const EdgeInsets.all(
              16),
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 34,
                  child: Text(
                    "M",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight:
                      FontWeight
                          .bold,
                    ),
                  ),
                ),

                const SizedBox(
                    width: 14),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        "Mohammed",
                        style:
                        TextStyle(
                          fontSize:
                          22,
                          fontWeight:
                          FontWeight
                              .bold,
                        ),
                      ),
                      SizedBox(
                          height:
                          4),
                      Text(
                        "mohammed@example.com",
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                        const SettingsView(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
              ],
            ),

            const SizedBox(
                height: 22),

            Row(
              children: const [
                Expanded(
                  child:
                  _StatCard(
                    icon: Icons
                        .description,
                    value:
                    "47",
                    title:
                    "Total Summaries",
                  ),
                ),
                SizedBox(
                    width: 12),
                Expanded(
                  child:
                  _StatCard(
                    icon: Icons
                        .schedule,
                    value:
                    "23.5",
                    title:
                    "Hours Saved",
                  ),
                ),
                SizedBox(
                    width: 12),
                Expanded(
                  child:
                  _StatCard(
                    icon: Icons
                        .workspace_premium,
                    value:
                    "12",
                    title:
                    "This Week",
                  ),
                ),
              ],
            ),

            const SizedBox(
                height: 24),

            Container(
              padding:
              const EdgeInsets.all(
                  18),
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    18),
                color: Theme.of(
                    context)
                    .cardColor,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  const Text(
                    "Upgrade to Premium",
                    style:
                    TextStyle(
                      fontSize:
                      22,
                      fontWeight:
                      FontWeight
                          .bold,
                    ),
                  ),
                  const SizedBox(
                      height:
                      10),
                  Text(
                    "Unlock unlimited summaries, advanced AI features, and priority support.",
                    style:
                    TextStyle(
                      color: Theme.of(
                          context)
                          .textTheme
                          .bodyMedium!
                          .color,
                    ),
                  ),
                  const SizedBox(
                      height:
                      18),
                  SizedBox(
                    width: double.infinity,
                    child:
                    ElevatedButton(
                      onPressed:
                          () {},
                      child:
                      const Text(
                        "Upgrade Now →",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
                height: 28),

            const Text(
              "Activity Summary",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 14),

            Container(
              decoration:
              BoxDecoration(
                color: Theme.of(
                    context)
                    .cardColor,
                borderRadius:
                BorderRadius.circular(
                    18),
              ),
              child: const Column(
                children: [
                  _ActivityRow(
                    title:
                    "Today",
                    value:
                    "5 summaries",
                  ),
                  _DividerLine(),
                  _ActivityRow(
                    title:
                    "Yesterday",
                    value:
                    "8 summaries",
                  ),
                  _DividerLine(),
                  _ActivityRow(
                    title:
                    "This Week",
                    value:
                    "12 summaries",
                  ),
                ],
              ),
            ),

            const SizedBox(
                height: 24),
          ],
        ),
      ),
    );
  }
}

class _StatCard
    extends StatelessWidget {
  final IconData icon;
  final String value;
  final String title;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.title,
  });

  @override
  Widget build(
      BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.all(
          14),
      decoration:
      BoxDecoration(
        color:
        Theme.of(context)
            .cardColor,
        borderRadius:
        BorderRadius.circular(
            16),
      ),
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(
              height: 10),
          Text(
            value,
            style:
            const TextStyle(
              fontSize: 24,
              fontWeight:
              FontWeight
                  .bold,
            ),
          ),
          const SizedBox(
              height: 6),
          Text(
            title,
            textAlign:
            TextAlign.center,
            style:
            const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityRow
    extends StatelessWidget {
  final String title;
  final String value;

  const _ActivityRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(
      BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text(
            value,
            style:
            TextStyle(
              color: Theme.of(
                  context)
                  .colorScheme
                  .primary,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _DividerLine
    extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(
      BuildContext context) {
    return Divider(
      height: 1,
      color: Theme.of(context)
          .dividerColor,
    );
  }
}