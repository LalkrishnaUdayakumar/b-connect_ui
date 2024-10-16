import 'dart:io';

import 'package:b_connect/api/login/login_resp.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/photo_uploader.dart';
import 'package:b_connect/donor_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  final LoginResponse? loginResponse;
  const MainScreen({
    super.key,
    required this.loginResponse,
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
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 05),
                  child: Text(
                    "Hello, ${widget.loginResponse?.userName}",
                    style: const TextStyle(
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
          Container(
            height: 160,
            width: 360,
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color.fromARGB(255, 215, 211, 211), // Border color
                width: 01, // Border width
              ),
              // Rounded corners
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    "Check Availability ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 215, 211, 211), // Border color
                            width: 01, // Border width
                          ),
                          // Rounded corners
                        ),
                        child: Image.asset(
                          'assets/images/a+.png', // Path to your image
                          width: 50, // Custom image width
                          height: 50, // Custom image height
                          // How the image should be fitted inside the container
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFffffff),
                        borderRadius: BorderRadius.circular(05),
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 215, 211, 211), // Border color
                          width: 01, // Border width
                        ),
                        // Rounded corners
                      ),
                      child: Image.asset(
                        'assets/images/b+.png', // Path to your image
                        width: 50, // Custom image width
                        height: 50, // Custom image height
                        // How the image should be fitted inside the container
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 215, 211, 211), // Border color
                            width: 01, // Border width
                          ),
                          // Rounded corners
                        ),
                        child: Image.asset(
                          'assets/images/o+.png', // Path to your image
                          width: 50, // Custom image width
                          height: 50, // Custom image height
                          // How the image should be fitted inside the container
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFffffff),
                        borderRadius: BorderRadius.circular(05),
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 215, 211, 211), // Border color
                          width: 01, // Border width
                        ),
                        // Rounded corners
                      ),
                      child: Image.asset(
                        'assets/images/AB+.png', // Path to your image
                        width: 50, // Custom image width
                        height: 50, // Custom image height
                        // How the image should be fitted inside the container
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 215, 211, 211), // Border color
                            width: 01, // Border width
                          ),
                          // Rounded corners
                        ),
                        child: Image.asset(
                          'assets/images/a-.png', // Path to your image
                          width: 50, // Custom image width
                          height: 50, // Custom image height
                          // How the image should be fitted inside the container
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFffffff),
                        borderRadius: BorderRadius.circular(05),
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 215, 211, 211), // Border color
                          width: 01, // Border width
                        ),
                        // Rounded corners
                      ),
                      child: Image.asset(
                        'assets/images/b-.png', // Path to your image
                        width: 50, // Custom image width
                        height: 50, // Custom image height
                        // How the image should be fitted inside the container
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 215, 211, 211), // Border color
                            width: 01, // Border width
                          ),
                          // Rounded corners
                        ),
                        child: Image.asset(
                          'assets/images/o-.png', // Path to your image
                          width: 50, // Custom image width
                          height: 50, // Custom image height
                          // How the image should be fitted inside the container
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 08, top: 08, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 215, 211, 211), // Border color
                            width: 01, // Border width
                          ),
                          // Rounded corners
                        ),
                        child: Image.asset(
                          'assets/images/AB-.png', // Path to your image
                          width: 50, // Custom image width
                          height: 50, // Custom image height
                          // How the image should be fitted inside the container
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF800000),
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                        child: const Center(
                          // Center the text inside the container
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
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
          const SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    width: 350,
                    child: CustomListTile(
                      name: 'Lalkrishna Udayakumar',
                      place: 'Poovar',
                      bloodType: 'O+',
                    ),
                  ),
                ],
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
