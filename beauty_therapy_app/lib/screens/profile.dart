import 'package:beauty_therapy_app/pages/home.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _customeAppBar(context),
              Row(
                children: [
                  Container(
                    width: size.width * 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.amberAccent, Colors.amberAccent[400]]),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: 110.0,
                                  height: 110.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5.0),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          ExactAssetImage('images/profile.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 80.0, left: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jaydip Patel",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Valsad, Gujrat",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildForm("Your Name"),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 20.0, right: 20.0, top: 0),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Jaydip",
                                  ),
                                ),
                              ),
                            ],
                          )),
                      _buildForm("Last Name"),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                decoration:
                                    const InputDecoration(hintText: "Patel"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildForm("Email Id"),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: "jaydippatel83.pj@gmail.com"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _getActionButtons(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(String lable) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        lable,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _customeAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              child: Icon(
                Icons.arrow_back,
                size: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              child: Icon(
                Icons.menu,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getActionButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.amberAccent,
                onPressed: () {
                  // setState(() {
                  //   _status = true;
                  //   FocusScope.of(context).requestFocus(  FocusNode());
                  // });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Container(
                    child: RaisedButton(
                  child: Text("Cancel"),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    // setState(() {
                    //   _status = true;
                    //   FocusScope.of(context).requestFocus(  FocusNode());
                    // });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                )),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
