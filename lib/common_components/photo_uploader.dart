import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends StatefulWidget {
  final String defaultImagePath; // Path to the default image asset
  final Function(File) onImageSelected;

  const PhotoUploader({
    super.key,
    required this.onImageSelected,
    this.defaultImagePath = 'assets/images/upload_img.png', // Default image
  });

  @override
  State<PhotoUploader> createState() => _PhotoUploaderState();
}

class _PhotoUploaderState extends State<PhotoUploader> {
  final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  Future<void> _getImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
      widget.onImageSelected(_profileImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from Gallery'),
                    onTap: () {
                      Navigator.pop(context);
                      _getImage(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Take a Photo'),
                    onTap: () {
                      Navigator.pop(context);
                      _getImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: _profileImage != null
          ? ClipOval(
              child: Image.file(
                _profileImage!,
                width: 100.0, // Adjust size as needed
                height: 100.0,
                fit: BoxFit.cover,
              ),
            )
          : ClipOval(
              child: Image.asset(
                widget.defaultImagePath,
                width: 100.0, // Adjust size as needed
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
