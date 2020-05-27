import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: "Jaydip Patel",
    description: "web developer",
    age: 25,
    imageUrl:
        "https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=5ee7fde147bc170a353a6c098a72fdd1&oe=5EF83714 150w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s240x240/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=d5db47859bfaeffad2ff6a2773d0b8c0&oe=5EF6F25A 240w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s320x320/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=de26f8db47c3cce8a7e00942ad15cc40&oe=5EF7A764 320w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s480x480/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=48278a6def27f81efc93453bda1141fd&oe=5EF642BA 480w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=f905c48db62fa181f95cde5b2a6eab04&oe=5EF896B5 640w",
  ),
  Kitten(
    name: "Rinkesh Patel",
    description: "web developer",
    age: 25,
    imageUrl:
        "https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=5ee7fde147bc170a353a6c098a72fdd1&oe=5EF83714 150w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s240x240/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=d5db47859bfaeffad2ff6a2773d0b8c0&oe=5EF6F25A 240w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s320x320/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=de26f8db47c3cce8a7e00942ad15cc40&oe=5EF7A764 320w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s480x480/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=48278a6def27f81efc93453bda1141fd&oe=5EF642BA 480w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=f905c48db62fa181f95cde5b2a6eab04&oe=5EF896B5 640w",
  ),
  Kitten(
    name: "Virendra Mehta",
    description: "Ios developer",
    age: 23,
    imageUrl:
        "https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/c180.0.720.720a/s150x150/44595575_347809772655912_8765722657270136138_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=pifExCOh7QQAX-rBwi1&oh=8408ec9c3767d8b58479aae4da28585d&oe=5EF83E27 150w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/c180.0.720.720a/s240x240/44595575_347809772655912_8765722657270136138_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=pifExCOh7QQAX-rBwi1&oh=184492c17b5ba67d08a49deb7ff474d1&oe=5EF6AD6D 240w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/c180.0.720.720a/s320x320/44595575_347809772655912_8765722657270136138_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=pifExCOh7QQAX-rBwi1&oh=1ed1037a728d620c8253dfbfdcdc455e&oe=5EF66D57 320w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/c180.0.720.720a/s480x480/44595575_347809772655912_8765722657270136138_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=pifExCOh7QQAX-rBwi1&oh=9ab7da39c3d863f56ae59aadb7632902&oe=5EF7D20D 480w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/c180.0.720.720a/s640x640/44595575_347809772655912_8765722657270136138_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=pifExCOh7QQAX-rBwi1&oh=0ee868df1f9ae280281c88963aa9cf47&oe=5EF716CF 640w",
  ),
  Kitten(
    name: "Hitesh Chavda",
    description: "Android developer",
    age: 24,
    imageUrl:
        "https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/69398195_376112629955647_5716784607094529319_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=fKGOuQzwZuwAX-ZYe3-&oh=6dc731e21ab31f8dbed595e80b1c9945&oe=5EF6D290 150w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s240x240/69398195_376112629955647_5716784607094529319_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=fKGOuQzwZuwAX-ZYe3-&oh=34e6d0a39e9537763dd9ad8fef6315de&oe=5EF82A46 240w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s320x320/69398195_376112629955647_5716784607094529319_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=fKGOuQzwZuwAX-ZYe3-&oh=a89817d55827678644a67cedd919ea92&oe=5EF6C400 320w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s480x480/69398195_376112629955647_5716784607094529319_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=fKGOuQzwZuwAX-ZYe3-&oh=c49e0192d9b2b112ef5e12ef9b2f5b02&oe=5EF792A6 480w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/69398195_376112629955647_5716784607094529319_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=107&_nc_ohc=fKGOuQzwZuwAX-ZYe3-&oh=4b2afd8647eb6708ff96134d0d8cafb1&oe=5EF8F729 640w",
  ),
  Kitten(
    name: "Kishan Jadav",
    description: "Wordpress Developer",
    age: 26,
    imageUrl:
        "https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s150x150/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=5ee7fde147bc170a353a6c098a72fdd1&oe=5EF83714 150w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s240x240/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=d5db47859bfaeffad2ff6a2773d0b8c0&oe=5EF6F25A 240w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s320x320/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=de26f8db47c3cce8a7e00942ad15cc40&oe=5EF7A764 320w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/e35/s480x480/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=48278a6def27f81efc93453bda1141fd&oe=5EF642BA 480w,https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s640x640/79935394_160385301873409_9008639771760150197_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=p4kaY5UwCy4AX8UMNCe&oh=f905c48db62fa181f95cde5b2a6eab04&oe=5EF896B5 640w",
  ),
];

class MyHomepage extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Text(_kittens[index].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Kittens"),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: _kittens.length,
        itemExtent: 60.0,
      ),
    );
  }
}
