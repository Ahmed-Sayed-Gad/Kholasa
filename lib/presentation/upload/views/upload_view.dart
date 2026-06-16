import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';

import '../widgets/upload_card.dart';
import '../widgets/upload_tabs.dart';

import '../../summarize/view/summarize_view.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration:
                    BoxDecoration(
                      color: Theme.of(
                          context)
                          .cardColor,
                      borderRadius:
                      BorderRadius
                          .circular(
                          14),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                            context);
                      },
                      icon: Icon(
                        Icons
                            .arrow_back_ios_new,
                        size: 18,
                        color: Theme.of(
                            context)
                            .iconTheme
                            .color,
                      ),
                    ),
                  ),

                  const SizedBox(
                      width: 14),

                  Text(
                    'New Summary',
                    style:
                    TextStyle(
                      color: Theme.of(
                          context)
                          .textTheme
                          .bodyLarge!
                          .color,
                      fontSize:
                      28,
                      fontWeight:
                      FontWeight
                          .w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                  height: 26),

              const UploadTabs(),

              const SizedBox(
                  height: 28),

              BlocConsumer<UploadCubit, UploadState>(
                listener: (context, state) {
                  if (state is UploadSuccess) {
                    final file = state.file;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SummarizeView(file: file),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return UploadCard(state: state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}