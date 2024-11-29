import 'package:b_connect/api/apis.dart';
import 'package:b_connect/app_provider.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/mainscreen/bloodtype_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScrollableBloodTypeContainer extends StatefulWidget {
  final List<Map<String, String>> bloodTypes;

  const ScrollableBloodTypeContainer({super.key, required this.bloodTypes});

  @override
  State<ScrollableBloodTypeContainer> createState() =>
      _ScrollableBloodTypeContainerState();
}

class _ScrollableBloodTypeContainerState
    extends State<ScrollableBloodTypeContainer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String? _bloodGroup;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Container(
      height: 150, // Reverted to original height
      width: 360,
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 215, 211, 211),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Check Availability",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      (widget.bloodTypes.length / 4).ceil(),
                      (index) => buildDotIndicator(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: (widget.bloodTypes.length / 4).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 4;
                final endIndex = (startIndex + 4 <= widget.bloodTypes.length)
                    ? startIndex + 4
                    : widget.bloodTypes.length;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.bloodTypes
                      .sublist(startIndex, endIndex)
                      .map((bloodType) {
                    return BloodtypeWidget(
                      imagePath: bloodType['imagePath']!,
                      onTap: () {
                        _bloodGroup = bloodType['bloodGroupName'];
                        debugPrint(
                            'Blood group: ${bloodType['bloodGroupName']}');
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                    height: 35,
                    width: 80,
                    buttonColor: const Color(0xFF800000),
                    onTap: () async {
                      try {
                        final response = await addProductToCart(
                            _bloodGroup!, appProvider.bearerToken!);
                        if (response != null) {
                          appProvider.setUserInfo(response.userInfo);
                        }
                      } catch (e, stackTrace) {
                        debugPrint('Error adding product to cart: $e');
                        debugPrint('Stack trace: $stackTrace');
                      }
                    },
                    widget: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white, height: 0),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDotIndicator(int index) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? const Color(0xFF800000)
            : Colors.grey.withOpacity(0.5),
      ),
    );
  }
}