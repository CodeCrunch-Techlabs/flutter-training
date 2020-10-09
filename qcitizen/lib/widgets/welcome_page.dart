import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qcitizen/screens/study_list_screen.dart';

class WelcomePage extends StatelessWidget {
  final screenData;


  WelcomePage(this.screenData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10, right: 0, bottom: 0, left: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(screenData.image),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                screenData.title,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Padding(  
              padding: EdgeInsets.only(left: 20, top: 4, right: 20, bottom: 4),
              child: Text(
                screenData.description,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
