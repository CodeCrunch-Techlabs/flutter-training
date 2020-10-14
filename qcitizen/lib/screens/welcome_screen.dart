import 'package:flutter/material.dart';
import 'package:qcitizen/model/welcome_screen_data.dart';
import 'package:qcitizen/widgets/welcome_page.dart';
import 'package:qcitizen/screens/study_list_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static var screensData = WelcomeScreenData().data;

  final pageController = new PageController();

  int initialPage = 0;

  void onAddButtonTapped(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  } // Change page on onclick of next button by passing page index.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    initialPage = index;
                  });
                },
                  controller: pageController,
                  itemCount: screensData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WelcomePage(screensData[index]);
                  }),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10),
                  height: 18,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: screensData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              width: 10,
                              decoration: BoxDecoration(
                                  color: initialPage == i
                                      ? Colors.green
                                      : Colors.green[100],
                                  shape: BoxShape.circle)),
                        );
                      })),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  initialPage == screensData.length - 1
                      ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudyList()))
                      : onAddButtonTapped(initialPage + 1);
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50.0,
                  decoration: screensData[initialPage].buttonColor == Colors.white
                      ? BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(20.0))
                      : null,
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: screensData[initialPage].buttonColor,
                      child: Center(
                        child: Text(
                          initialPage == screensData.length - 1 ? "Sign up" : "Next",
                          style: TextStyle(
                            color: screensData[initialPage].buttonColor == Colors.green
                                ? Colors.white
                                : Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
