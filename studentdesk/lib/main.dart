import 'package:flutter/material.dart';
import 'package:studentdesk/Books_Cubit/Book_Cubit.dart';
import 'package:studentdesk/Screens/BookList.dart';
import 'package:studentdesk/Login_Cubit/Login_Cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocProvider(
        create: (context) => BooksCubit(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "JosefinSans",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookList(),
    );
  }
}

