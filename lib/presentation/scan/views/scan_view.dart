import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/scan_cubit.dart';
import '../cubit/scan_state.dart';
import '../../../../l10n/app_localizations.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.scanImage),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ScanCubit, ScanState>(
          builder: (context, state) {
            if (state is ScanLoading) {
              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if (state is ScanSuccess) {
              return Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(16),
                    child: Image.file(
                      state.image,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Extracted Text:",
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        state.text.isEmpty
                            ? "No text found"
                            : state.text,
                        style:
                        const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<ScanCubit>()
                            .reset();
                      },
                      child:
                      Text(AppLocalizations.of(context)!.scanAgain),
                    ),
                  ),
                ],
              );
            }

            if (state is ScanFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            }

            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<ScanCubit>()
                      .scanImage();
                },
                child: const Text(
                  "Choose Image",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}