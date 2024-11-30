import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String name;
  final String place;
  final String bloodType;
  final String userImage;
  final String bloodGroupImage;

  const CustomListTile({
    super.key,
    required this.name,
    required this.place,
    required this.bloodType,
    required this.userImage,
    required this.bloodGroupImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(
                0, 3), // Offset on the Y-axis to push the shadow down
          ),
        ],
      ),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipOval(
            child: Image.asset(
              userImage, // Example image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(place, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: Image.asset(
          bloodGroupImage, // Path to your image
          width: 50, // Custom image width
          height: 50, // Custom image height
          // How the image should be fitted inside the container
        ),
      ),
    );
  }
}
