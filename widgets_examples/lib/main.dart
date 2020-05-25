
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: Text(
                  "50.0%",
                  style: new TextStyle(fontSize: 12.0),
                ),
                trailing: Icon(Icons.mood),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: new Text("left content"),
                trailing: new Text("right content"),
                percent: 0.2,
                center: Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  new LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.2,
                    progressColor: Colors.red,
                  ),
                  new LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.5,
                    progressColor: Colors.orange,
                  ),
                  new LinearPercentIndicator(
                    width: 100.0,
                    lineHeight: 8.0,
                    percent: 0.9,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
   ),
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