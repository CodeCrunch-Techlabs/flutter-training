import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcapp/bloc/study_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcapp/bloc/study_list_state.dart';

class StudyList extends StatefulWidget {
  @override
  _StudyListState createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.grey[500]),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Studies',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey[400],
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: StudyListScreen(),
//      bottomSheet: FixedFooter(),
    );
  }
}

class StudyListScreen extends StatefulWidget {
  @override
  _StudyListScreenState createState() => _StudyListScreenState();
}

class _StudyListScreenState extends State<StudyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: BlocBuilder<StudyBloc, StudyState>(builder: (context, state) {
          if (state is StudyListLoadSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.studyList.length,
                      itemBuilder: (BuildContext context, index) {
                        return state.studyList[index].status == 'Active'
                            ? InkWell(
                                child: buildStudyItem(state, index),
                                onTap: () {},
                              )
                            : Container();
                      }),
                ),
                FixedFooter(),
              ],
            );
          }
          if (state is StudyLoadFailure) {
            return Center(
              child: Text(
                "Something went wrong!",
                style: TextStyle(fontSize: 16.0),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green[300],
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          );
        }));
  }
}

Padding buildStudyItem(StudyListLoadSuccess state, int index) {
  return Padding(
    padding: EdgeInsets.all(4.0),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 80.0,
              child: state.studyList[index].logo.contains("html")
                  ? Image.asset('images/notfound.png',
                      height: 80, fit: BoxFit.fill)
                  : Image.network('${state.studyList[index].logo},',
                      height: 80, fit: BoxFit.fill),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 2.0),
                      child: Container(
                          width: 15.0,
                          height: 15.0,
                          decoration: new BoxDecoration(
                            color: Colors.pink[900],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 2.0),
                        child: Text("Yet To Join",
                            style: TextStyle(
                                color: Colors.pink[900],
                                fontSize: 12,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 2.0),
                    child: Text("${state.studyList[index].title}",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 2.0),
                  child: Container(
                    width: 235.0,
                    child: Text("${state.studyList[index].tagline}",
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: RichText(
                    text: TextSpan(
                        text: 'COMPLETION:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' 0%',
                            style: TextStyle(
                                color: Colors.pink[900],
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Padding FixedFooter() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
      width: double.infinity,
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(
                    color: Colors.lightGreen,
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Colors.lightGreen,
                    width: 2.0,
                  ),
                  right: BorderSide(
                    color: Colors.lightGreen,
                    width: 2.0,
                  ),
                )),
                child: Text(
                  "Upcoming Studies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Colors.pink[900],
                height: 12,
                thickness: 1,
                endIndent: 30,
                indent: 30,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Learn about and participate in upcoming studies on topics ranging from keto to intermittent fasting to learn what works for people like you.',
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Interested in running a study?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                child: Text(
                  "Let's connect",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              )
            ],
          )),
    ),
  );
}
