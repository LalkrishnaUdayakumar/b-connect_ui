import 'dart:io';

import 'package:b_connect/app_provider.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/photo_uploader.dart';
import 'package:b_connect/constants.dart';
import 'package:b_connect/donor_list.dart';
import 'package:b_connect/mainscreen/scrollable_blood_type_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? _uploadedImage;

  // Callback to handle image selection
  void _onImageSelected(File image) {
    setState(() {
      _uploadedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    List<Widget> customTiles = [];
    for (var userInfo in appProvider.getUserInfo) {
      customTiles.add(
        CustomListTile(
          name: userInfo.userName!,
          place: userInfo.place!,
          bloodType: userInfo.bloodGroup!,
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                height: 200, // Adjust this height based on your needs
                color: const Color(0xFF800000), // Your desired background color
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 350, top: 25),
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.white, size: 25),
                onPressed: () {
                  _logout(context);
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 25),
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: PhotoUploader(
                        onImageSelected: _onImageSelected,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0, left: 05),
                  child: Text(
                    "",
                    // "Hello, ${widget.loginResponse?.userName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 120,
                      width: 370,
                      decoration: BoxDecoration(
                        color: const Color(0xFFffffff),
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.3), // Shadow color
                            spreadRadius: 0.2, // How much the shadow spreads
                            blurRadius: 2, // Softness of the shadow
                            offset: const Offset(
                                3, 3), // Horizontal and vertical shadow offset
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "You can become a Blood Donor",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 50,
                                          height: 1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RichText(
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors
                                                .black, // Adjust color as needed
                                          ),
                                          children: [
                                            TextSpan(text: "Easy\n"),
                                            TextSpan(text: "Steps"),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    context.go('/${LoginPage.id}');
                                  },
                                  child: const Text(
                                    "Become a Donor Now!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF800000),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ClipOval(
                              child: Image.asset(
                                'assets/images/donate_illustration.jpg', // Example image URL
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Container(
          //           height: 100,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             color: const Color(0xFFffffff),
          //             borderRadius:
          //                 BorderRadius.circular(15), // Rounded corners
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.3), // Shadow color
          //                 spreadRadius: 5, // How much the shadow spreads
          //                 blurRadius: 10, // Softness of the shadow
          //                 offset: const Offset(
          //                     3, 3), // Horizontal and vertical shadow offset
          //               ),
          //             ],
          //           )),
          //     ),
          //     Container(
          //         height: 100,
          //         width: 100,
          //         decoration: BoxDecoration(
          //           color: const Color(0xFFffffff),
          //           borderRadius: BorderRadius.circular(15), // Rounded corners
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.3), // Shadow color
          //               spreadRadius: 5, // How much the shadow spreads
          //               blurRadius: 10, // Softness of the shadow
          //               offset: const Offset(
          //                   3, 3), // Horizontal and vertical shadow offset
          //             ),
          //           ],
          //         )),
          //     Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Container(
          //           height: 100,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             color: const Color(0xFFffffff),
          //             borderRadius:
          //                 BorderRadius.circular(15), // Rounded corners
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.3), // Shadow color
          //                 spreadRadius: 5, // How much the shadow spreads
          //                 blurRadius: 10, // Softness of the shadow
          //                 offset: const Offset(
          //                     3, 3), // Horizontal and vertical shadow offset
          //               ),
          //             ],
          //           )),
          //     ),
          //   ],
          // ),
          const ScrollableBloodTypeContainer(bloodTypes: bloodTypes),
          const SizedBox(
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 50,
                ),
                Text(
                  "Available  donors",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: customTiles,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Theme(
        data: Theme.of(context).copyWith(),
        child: AlertDialog(
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), // Set the background color to red
          title: const Text('Confirm Logout',
              style: TextStyle(
                  color: Color(0xFF800000), fontWeight: FontWeight.w800)),
          content: const Text('Are you sure you want to log out?',
              style: TextStyle(
                  color: Color(0xFF800000),
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('Yes', style: TextStyle(color: Color(0xFF800000))),
              onPressed: () {
                context.go('/${HomePage.id}');
              },
            ),
            TextButton(
              child:
                  const Text('No', style: TextStyle(color: Color(0xFF800000))),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
