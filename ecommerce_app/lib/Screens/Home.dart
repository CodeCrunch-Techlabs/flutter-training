import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Categories.dart';
import '../ItemList.dart';
import '../BottomNavigation.dart';
import 'package:ecommerceapp/Screens/AddCart.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Theme.of(context).primaryColor,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.orange[200]))), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigation()
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: FaIcon(FontAwesomeIcons.bars,
                          color: Theme.of(context).primaryColor),
                      onTap: (){
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: FaIcon(FontAwesomeIcons.search,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCartPage()));
                          },
                          child: FaIcon(FontAwesomeIcons.shoppingBag,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Home Furnitures",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Theme.of(context).primaryColor,
                 ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CategoriesTabs(),
              ItemList(),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ProfieDrawer()
      )
    );
  }
}


class ProfieDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: DrawerHeader(
              child: Text("Header"),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView(children: [
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ]),
        )
      ],
    );
  }
}

