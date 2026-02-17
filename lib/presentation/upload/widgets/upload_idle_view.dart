import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/upload_cubit.dart';

class UploadIdleView extends StatelessWidget {
  const UploadIdleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.upload_rounded,
          size: 48,
          color: ColorManager.primary,
        ),
        const SizedBox(height: 12),

        const Text(
          'Drop your files here',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),

        Text(
          'or click to browse from your computer',
          style: TextStyle(color: ColorManager.hintTextColor),
        ),
        const SizedBox(height: 20),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff22D3EE),
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            context.read<UploadCubit>().pickFile();
          },
          child: Text('Choose Files',style: TextStyle(color: ColorManager.black),),
        ),
        const SizedBox(height: 16),

        Text(
          'Supported formats: PDF, Word, PowerPoint, Images\n'
              'Maximum size: 25MB • Up to 5 files at once',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManager.hintTextColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
