import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcapp/bloc/study_list_bloc.dart';
import 'package:qcapp/bloc/study_list_event.dart';
import 'package:qcapp/repository/study_repository.dart';
import 'package:qcapp/widget/welcome_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<StudyBloc>(
        create: (context) {
          return StudyBloc(
            studyRepository: StudyRepository(),
          )..add(LoadStudyList());
        },
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QC app',
      color: Colors.white,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
