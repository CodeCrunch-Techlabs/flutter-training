import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcitizen/Api/Study_List_Data.dart';
import 'package:qcitizen/Widgets/Bottom_Infor.dart';
import 'package:qcitizen/Widgets/Study_Item.dart';

class StudyList extends StatefulWidget {
  @override
  _StudyListState createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {
  static List studyList;

  @override
  void initState() {
    super.initState();
    Studies().fetchStudies().then((value) {
      setState(() {
        studyList = value;
      });
    }); // Stored return value into the studyList array.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: studyList == null
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.black12,
                            onPressed: null),
                        Text(
                          "Studies",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          color: Colors.black12,
                          onPressed: null,
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: studyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StudyItem(studyList[index]);
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BottomInfo()
                  ],
                )),
    );
  }
}
