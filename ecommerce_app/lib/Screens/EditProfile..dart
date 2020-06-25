import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: FaIcon(FontAwesomeIcons.chevronLeft,
                                  color: Theme.of(context).primaryColor),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            GestureDetector(
                              child: Text('Edit Profile',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: FaIcon(FontAwesomeIcons.times,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child :new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            'assets/images/as.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 70.0, right:  1.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 25.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ])
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Tap");
                  },
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: PersonalInfo()
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {


  TextEditingController firstnameController = new TextEditingController(text: "Mansi");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
          controller: firstnameController,
        decoration: InputDecoration(
            labelText: 'First Name',
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme
                    .of(context)
                    .secondaryHeaderColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme
                  .of(context)
                  .secondaryHeaderColor),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Theme
                    .of(context)
                    .secondaryHeaderColor)),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))),

      ),
      SizedBox(
        height: 20.0,
      ),
          TextFormField(
            initialValue: "Joshi",
        decoration: InputDecoration(
          labelText: 'Last Name   ',
          hintStyle: TextStyle(
              color: Theme
                  .of(context)
                  .secondaryHeaderColor
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme
                  .of(context)
                  .secondaryHeaderColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme
                .of(context)
                .secondaryHeaderColor),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme
                  .of(context)
                  .secondaryHeaderColor)),
          focusedErrorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
          TextFormField(
            initialValue: "mansijoshi17799@gmail.com  ",
        decoration: InputDecoration(
          labelText: 'Email Id',
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme
                  .of(context)
                  .secondaryHeaderColor),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme
                .of(context)
                .secondaryHeaderColor),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme
                  .of(context)
                  .secondaryHeaderColor)),
          focusedErrorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
      ),
      SizedBox(
        height: 40.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              print(firstnameController.text);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme
                    .of(context)
                    .secondaryHeaderColor,),
              child: Text(
                "Save ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme
                    .of(context)
                    .secondaryHeaderColor,),
              child: Text(
                "Cancel ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      )
      ],
    ));
  }
}
