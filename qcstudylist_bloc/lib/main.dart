import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcstudylistbloc/bloc/study_list_bloc.dart';
import 'package:qcstudylistbloc/repository/study_list_repository.dart';
import 'package:qcstudylistbloc/screens/study_list_screen.dart';

void main() {
  runApp(
    BlocProvider<StudyListBloc>(
      create: (context){
        return  StudyListBloc(studyRepository: StudyListRepository() );
      },
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StudyList(),
    );
  }
}

