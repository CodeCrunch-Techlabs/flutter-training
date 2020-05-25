
import 'package:flutter/material.dart';

void main() => runApp(ClipPathApp());

class ClipPathApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   title: 'Sample Divider Widget',
   home: ClipPathWidget(),
  );
 }
}

class ClipPathWidget extends StatefulWidget {
 ClipPathWidget({
  Key key
 }): super(key: key);

 @override
 _ClipPathWidgetState createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State {

 @override
 void initState() {
  super.initState();
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(title: Text("Sample ClipPath Widget"), backgroundColor: Colors.black45, ),
   body: Center(
    child: Stack(
     children: [
      ClipPath( 
       child: Container(
        color: Colors.black,
       ),

      ),
      Container(
       child: Column(
        children: [
         Image.network("https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_960_720.png", width: 100.0, height: 100.0, ),
         Text("John Doe", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), )
        ],
       ),
      )

     ],
    ),
   )
  );
 }
}

class LinePathClass extends CustomClipper {
 @override
 Path getClip(Size size) {
  var path = new Path();
  path.lineTo(0, 300);
  path.lineTo(325, 0);
  path.lineTo(size.width - 300, size.height - 500);
  return path;
 }

 @override
 bool shouldReclip(CustomClipper oldClipper) { 
  return false;
 }

}