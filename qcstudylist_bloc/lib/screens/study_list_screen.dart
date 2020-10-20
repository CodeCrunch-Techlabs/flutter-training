import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcstudylistbloc/bloc/study_list_event.dart';
import 'package:qcstudylistbloc/bloc/study_list_state.dart';
import 'package:qcstudylistbloc/bloc/study_list_bloc.dart';
import 'package:qcstudylistbloc/widget/study_Item.dart';


class StudyList extends StatefulWidget {

  @override
  _StudyListState createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<StudyListBloc>(context).add(LoadStudyList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StudyListBloc, StudyListState>(builder: (context, state) {
           if(state is StudyListLoadSuccess){
             return Column(
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
                       itemCount: state.studyList.length,
                       itemBuilder: (BuildContext context, int index) {
                         return StudyItem(state.studyList[index]);
                       }),
                 ),
                 SizedBox(
                   height: 20,
                 ),
               ],
             );
           }
           if(state is StudyLoadFailure){
             return Text("Something went wrong");
           }
           return Center(child: CircularProgressIndicator(),);
        }, )
      )
    );
  }
}
