import 'package:beauty_therapy_app/pages/detailpage.dart';
import 'package:beauty_therapy_app/pages/food.dart';
import 'package:beauty_therapy_app/pages/order.dart';
import 'package:beauty_therapy_app/pages/payment.dart';
import 'package:beauty_therapy_app/pages/rating.dart';
import 'package:beauty_therapy_app/pages/setting.dart';
import 'package:beauty_therapy_app/screens/profile.dart';
import 'package:beauty_therapy_app/screens/welcome.dart';
import 'package:beauty_therapy_app/widgets/clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  List<Food> food = Food.list;
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: AnimationLimiter(
          child: AnimationConfiguration.staggeredGrid(
            position: 1,
            duration: const Duration(milliseconds: 1000),
            delay: Duration(milliseconds: 200),
            columnCount: 1,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _createHeader(),
                    _createDrawerItem(
                      icon: Icons.person,
                      text: 'Login',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => WelcomeScreen(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.shop,
                      text: 'Orders',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Order(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.payment,
                      text: 'Payments',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Payment(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Setting(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.contacts,
                      text: 'Contacts',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.star,
                      text: 'Rating',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Rating(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Logout',
                    ),
                    Divider(),
                    _createDrawerItem(
                      icon: Icons.bug_report,
                      text: 'Report an issue',
                    ),
                    // ListTile(
                    //   title: Text('0.0.1'),
                    //   onTap: () {},
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: _buildRightSection(),
            ),
            Container(
              color: Colors.amberAccent[100],
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 25),
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>  Profile(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: ExactAssetImage("images/profile.jpg"),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Colors.amberAccent[200]),
                      child: Center(
                        child: Icon(Icons.menu),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildmenu("images/ice.png", 0),
                        _buildmenu("images/pizza.png", 1),
                        _buildmenu("images/fast-food.png", 2),
                        _buildmenu("images/sandwich.png", 3),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(left: paddingLeft),
                      width: 150,
                      height: 75,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: AppClipper(),
                              child: Container(
                                width: 150,
                                height: 60,
                                color: Colors.amberAccent[100],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: math.pi / 2,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/a3.jpg'),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "Fast-Food App",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildRightSection() {
    return Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          _customeAppbar(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 330,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: food.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage(food[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            children: [
                              _builCardSlider(index),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                  angle: math.pi / 3,
                                  child: Hero(
                                    tag: "image${food[index].imgPath}",
                                    child: Image(
                                      width: 150,
                                      image: AssetImage(
                                          "images/${food[index].imgPath}"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Recomended For You",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildmenu(String menu, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * 100.0;
        });
      },
      child: AnimationLimiter(
        child: AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 1000),
          delay: Duration(milliseconds: 200),
          columnCount: 1,
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Container(
                width: 110,
                padding: EdgeInsets.only(top: 10),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(menu),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builCardSlider(index) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredGrid(
        position: index,
        duration: const Duration(milliseconds: 1000),
        delay: Duration(milliseconds: 200),
        columnCount: 1,
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: Container(
              margin: EdgeInsets.only(top: 50, bottom: 20, right: 10, left: 10),
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5.0),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(food[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "${food[index].name}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${food[index].item}",
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${food[index].price.toInt()}",
                          style: TextStyle(
                              color: Colors.amberAccent[200],
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Colors.amberAccent[200],
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          child: Icon(
                            Icons.shop,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularList() {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: food.length,
        padding: EdgeInsets.only(left: 30, bottom: 16, top: 20, right: 20),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 1000),
            columnCount: 1,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image(
                        width: 70,
                        image: AssetImage("images/${food[index].imgPath}"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${food[index].name}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${food[index].price.toInt()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.amberAccent[200],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              // Text(
                              //   "${food[index].weight.toInt()}gm Weight",
                              //   style: TextStyle(fontSize: 12),
                              // ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _customeAppbar() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        RichText(
          text: TextSpan(
              text: "Find Your'\n",
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "Favourite Foods",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    height: 1.5,
                  ),
                )
              ]),
        ),
      ],
    ),
  );
}
