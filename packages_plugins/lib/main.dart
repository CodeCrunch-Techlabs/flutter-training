 import 'package:css_colors/css_colors.dart';
 import 'package:flutter/material.dart';

 void main() {
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: DemoPage(),
     );
   }
 }

 class DemoPage extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(body: Container(color: CSSColors.orange));
   }
 }
