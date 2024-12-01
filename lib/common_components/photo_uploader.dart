import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploader extends StatefulWidget {
  final String defaultImagePath; // Path to the default image asset
  final Function(File) onImageSelected;
  final dynamic existingImage; // Can be File, NetworkImage, or base64 bytes

  const PhotoUploader({
    super.key,
    required this.onImageSelected,
    this.defaultImagePath = 'assets/images/upload_img.png', // Default image
    this.existingImage,
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

  Widget _buildImageWidget() {
    // If a new image is selected, show that
    if (_profileImage != null) {
      return ClipOval(
        child: Image.file(
          _profileImage!,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      );
    }

    // If existing image is base64 bytes
    if (widget.existingImage is List<int>) {
      return ClipOval(
        child: Image.memory(
          widget.existingImage,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      );
    }

    // If existing image is a File
    if (widget.existingImage is File) {
      return ClipOval(
        child: Image.file(
          widget.existingImage,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover,
        ),
      );
    }

    // Fallback to default image
    return ClipOval(
      child: Image.asset(
        widget.defaultImagePath,
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
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
          child: _buildImageWidget(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.camera_alt,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
