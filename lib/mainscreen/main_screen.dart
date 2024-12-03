import 'dart:io';
import 'dart:math';

import 'package:b_connect/api/apis.dart';
import 'package:b_connect/app_provider.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/helper_methods.dart';
import 'package:b_connect/common_components/photo_uploader.dart';
import 'package:b_connect/constants.dart';
import 'package:b_connect/donor_list.dart';
import 'package:b_connect/mainscreen/scrollable_blood_type_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  File? uploadedImage;

  // Callback to handle image selection
  void _onImageSelected(File image) async {
    final context = this.context;
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: const Color(0xFF800000),
          size: 50,
        ),
      ),
    );
    try {
      final stopwatch = Stopwatch()..start();

      final encodeedImage = await encodeImageToBase64(image);

      final response =
          await saveUserProfilePhoto(encodeedImage, appProvider.bearerToken!);
      final elapsedTime = stopwatch.elapsedMilliseconds;
      final remainingTime = max(0, 1200 - elapsedTime);

      // Wait for remaining time if needed
      if (remainingTime > 0) {
        await Future.delayed(Duration(milliseconds: remainingTime));
      }

      // Close loading dialog
      navigator.pop();
      if (response != null) {
        setState(() {
          uploadedImage = image;
        });

        if (response.responseMessage == 'success') {
          showSnackBar(
            scaffoldMessenger,
            response.responseDescription ?? '',
          );
        }
      }
    } catch (e, stackTrace) {
      showSnackBar(scaffoldMessenger, 'Error while save image', status: false);
      debugPrint('Error while save image: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user data when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, appProvider, child) {
        String userImage;
        List<Widget> customTiles = appProvider.getUserInfo.map((userInfo) {
          if (userInfo.gender == 'Male') {
            userImage = 'assets/images/male_profile.png';
          } else {
            userImage = 'assets/images/female_profile.png';
          }

          return CustomListTile(
            name: userInfo.userName ?? 'Unknown',
            place: userInfo.place ?? 'Unknown',
            bloodType: userInfo.bloodGroup ?? 'Unknown',
            bloodGroupImage: bloodTypes.firstWhere(
                  (bloodType) =>
                      bloodType['bloodGroupName'] == userInfo.bloodGroup,
                  orElse: () => {'imagePath': ''},
                )['imagePath'] ??
                '',
            userImage: userInfo.imageBytes == null ? userImage : '',
            bytes: userInfo.imageBytes != null
                ? decodeBase64ToImage(userInfo.imageBytes!)
                : '',
          );
        }).toList();
        return Column(
          children: [
            Stack(children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  height: 200, // Adjust this height based on your needs
                  color:
                      const Color(0xFF800000), // Your desired background color
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
                          existingImage: decodeBase64ToImage(appProvider
                              .getLoginResponse!.userdetails.imageBytes),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 10),
                    child: Text(
                      "Hello, ${appProvider.getLoginResponse!.userdetails.userName}",
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
                              offset: const Offset(3,
                                  3), // Horizontal and vertical shadow offset
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
        );
      }),
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
