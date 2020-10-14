import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcapp/api/welcome_screen_data.dart';
import 'package:qcapp/widget/study_list.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  int initialIndex = 0;
  final pageController = new PageController();

  void onNextTap(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    int totalPage = LandingScreenItems.loadLandingScreenItem().length;
    return MaterialApp(
      color: Colors.white,
      title: "Study list",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22.0),
              headline5: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText1: TextStyle(fontSize: 14.0, color: Colors.black),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.black))),
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    initialIndex = index;
                  });
                },
                itemCount: totalPage,
                itemBuilder: (BuildContext context, int index) {
                  LandingScreenItem li =
                      LandingScreenItems.loadLandingScreenItem()[index];
                  return Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: Image.asset(
                                li.image,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              li.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
                          child: Center(
                            child: Text(
                              "${li.subTitle}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 12.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: totalPage,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: initialIndex == i
                                    ? Colors.green
                                    : Colors.grey,
                                shape: BoxShape.circle),
                            width: 20.0,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      initialIndex == totalPage - 1
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudyList()),
                            )
                          : onNextTap(initialIndex + 1);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: (initialIndex == totalPage - 1)
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green[500],
                            )
                          : initialIndex == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green[500],
                                )
                              : BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                          child: Text(
                        initialIndex == totalPage - 1 ? "Sign Up" : "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: (initialIndex == totalPage - 1)
                                ? Colors.white
                                : initialIndex == 0 ? Colors.white : Colors.green[600]),
                      )),
                      width: double.infinity,
                      height: 50.0,
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
