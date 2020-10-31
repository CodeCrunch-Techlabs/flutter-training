import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'carousel.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CoinDetails extends StatelessWidget {
  final String name;
  final double rate;
  final double price;
  CoinDetails(this.name, this.rate, this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFF8A008), Color(0xFFF8A040)],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white30,
                          ),
                          child: Image(
                            image: AssetImage("assets/images/bitcoin.png"),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          name,
                          style: TextStyle(fontSize: 18, color: Colors.white60),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white30,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white60,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$$rate",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      height: 10,
                      width: 10,
                      image: AssetImage("assets/images/up_arrow.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.46%",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "B1.00000000",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$$price",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "24 HOUR HIGH",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${10537.92}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "24 HOUR LOW",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.alarm,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.pages,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: cardsBody(),
          ),
        ],
      ),
    );
  }
}

Widget _buildTotalCap(String name, String volume) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        Text(
          volume,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[800],
          ),
        ),
      ],
    ),
  );
}

Widget cardsBody() {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'V89BOZhJFlI',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      controlsVisibleAtStart: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
    ),
  );
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildTotalCap("24 Hrs Volume", "\$${38.95} B"),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap("Total Coins", "\$${18.25} B"),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap("Market Cap", "\$${166.51} B"),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bitcoin uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of bitcoins is carried out collectively by the network. Bitcoin is open-source; its design is public, nobody owns or controls Bitcoin and everyone can take part.",
                    style: TextStyle(
                      // fontSize: 16,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  YoutubePlayer(
                    controller: _controller,
                    onReady: () {
                      _controller.play();
                    },
                    showVideoProgressIndicator: true,
                    topActions: <Widget>[
                      SizedBox(width: 0.0),
                      Expanded(
                        child: Text(
                          _controller.metadata.title,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StickyHeader(
                    header: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        "Important Links",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    content: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                child: Image(
                                  width: 100,
                                  image:
                                      AssetImage('assets/images/bitcoin.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text("Facebook"),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                child: Image(
                                  width: 100,
                                  image:
                                      AssetImage('assets/images/bitcoin.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text("Facebook"),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                child: Image(
                                  width: 100,
                                  image:
                                      AssetImage('assets/images/bitcoin.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text("Facebook"),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                child: Image(
                                  width: 100,
                                  image:
                                      AssetImage('assets/images/bitcoin.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text("Facebook"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image(
                              width: 100,
                              image: AssetImage('assets/images/bitcoin.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Facebook"),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image(
                              width: 100,
                              image: AssetImage('assets/images/bitcoin.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Facebook"),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image(
                              width: 100,
                              image: AssetImage('assets/images/bitcoin.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Facebook"),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            child: Image(
                              width: 100,
                              image: AssetImage('assets/images/bitcoin.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text("Facebook"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselWithIndicatorDemo(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
