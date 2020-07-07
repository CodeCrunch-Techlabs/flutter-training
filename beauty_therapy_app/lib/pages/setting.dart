import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'home.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _customeAppBar(context),
            _buildLable("Language"),
            _buildLanguage("English", "Edit"),
            _buildLable("Location"),
            _buildLanguage("Ahmedabad", "Edit"),
            SizedBox(
              height: 30,
            ),
            _buildSlieder(
              "Recive Notification",
               
            ),
            _buildSlieder(
              "Recive Newsletters",
               
            ),
            _buildSlieder(
              "Recive Offers",
               
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  color: Colors.amberAccent[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }),
                    );
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLable(String lable) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              lable,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSlieder(String language) {
    bool status = false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          CustomSwitch(
            activeColor: Colors.amberAccent,
            value: status,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguage(String language, String edit) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            edit,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}
