import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopapp/Screens/auth_screen.dart';
import 'package:shopapp/main.dart';


void main(){

  testWidgets("Check MateriaApp", (WidgetTester tester) async{

    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);

  });

  testWidgets("check title of app", (WidgetTester tester) async{

    await tester.pumpWidget(MaterialApp(
      home: AuthScreen(),
    ));

    expect(find.text("MyShop"), findsOneWidget);
  });

  testWidgets("check TextFormField", (WidgetTester tester) async{

    await tester.pumpWidget(MaterialApp(
      home: AuthScreen(),
    ));

    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}