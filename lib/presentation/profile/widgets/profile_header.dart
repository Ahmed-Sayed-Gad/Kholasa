import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../core/services/user_storage.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../settings/views/settings_view.dart';

class ProfileHeader extends StatefulWidget {
  final ProfileEntity profile;

  const ProfileHeader({
    required this.profile,
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  String? _localPhotoPath;

  @override
  void initState() {
    super.initState();
    _loadPhoto();
  }

  Future<void> _loadPhoto() async {
    final path = await UserStorage.getProfilePhotoPath();
    if (mounted) {
      setState(() {
        _localPhotoPath = path;
      });
    }
  }

  Future<String?> _cropImage(String sourcePath) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Cover Photo',
          toolbarColor: const Color(0xFF0F172A),
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: const Color(0xFF22D3EE),
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Cover Photo',
        ),
      ],
    );
    return croppedFile?.path;
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined, color: Theme.of(context).primaryColor),
                title: const Text('Take Photo'),
                onTap: () async {
                  Navigator.pop(sheetContext);
                  final picked = await picker.pickImage(source: ImageSource.camera);
                  if (picked != null) {
                    final cropped = await _cropImage(picked.path);
                    if (cropped != null) {
                      await UserStorage.saveProfilePhotoPath(cropped);
                      setState(() {
                        _localPhotoPath = cropped;
                      });
                    }
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library_outlined, color: Theme.of(context).primaryColor),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(sheetContext);
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    final cropped = await _cropImage(picked.path);
                    if (cropped != null) {
                      await UserStorage.saveProfilePhotoPath(cropped);
                      setState(() {
                        _localPhotoPath = cropped;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider backgroundImage = (_localPhotoPath != null && File(_localPhotoPath!).existsSync())
        ? FileImage(File(_localPhotoPath!))
        : const NetworkImage(
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=800&q=80',
          ) as ImageProvider;

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Dark gradient overlay to ensure text readability
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Edit Photo button at the top left corner
          Positioned(
            top: 8,
            left: 8,
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              child: IconButton(
                onPressed: _pickPhoto,
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                tooltip: 'Change Cover Photo',
              ),
            ),
          ),
          // Settings button at the top right corner
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsView(),
                  ),
                );
              },
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
          // Name and email at the bottom left
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.profile.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25, // Scaled +3
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.profile.email,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 17, // Scaled +3
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}