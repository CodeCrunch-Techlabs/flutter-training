import 'package:flutter/material.dart';
import 'package:qcitizen/Model/Welcome_Screen_Data.dart';
import 'package:qcitizen/Widgets/Welcome_Page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static var screensData = WelcomeScreenData().data;

  final pageController = new PageController();

  void onAddButtonTapped(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  } // Change page on onclick of next button by passing page index.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
            physics: new NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: screensData.length,
            itemBuilder: (BuildContext context, int index) {
              return WelcomePage(screensData.length, index, screensData[index],
                  onAddButtonTapped);
            }),
      ),
    );
  }
}
