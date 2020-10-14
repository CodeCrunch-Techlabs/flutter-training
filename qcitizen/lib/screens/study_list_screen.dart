import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcitizen/api/study_list_data.dart';
import 'package:qcitizen/widgets/bottom_infor.dart';
import 'package:qcitizen/widgets/study_item.dart';

class StudyList extends StatefulWidget {
  @override
  _StudyListState createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {
  static List studyList;

  @override
  void initState() {
    super.initState();
    Studies().fetchStudies().then((value) => setState((){
      studyList = value;
    }));
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
