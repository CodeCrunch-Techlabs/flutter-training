import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:traveldairy/Provider/Places_Provider.dart';

class PlaceDetails extends StatelessWidget {
  static const routeName = '/placedetails';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)..settings.arguments;
    final selectedPlace = Provider.of<GreatPlaces>(context).findById(id.toString());
    return Scaffold(
       appBar: AppBar(
         title: Text(selectedPlace.title),
       ),
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.infinity,
            child: Image.file(selectedPlace.image, fit: BoxFit.cover, width: double.infinity,),
          ),
          SizedBox(height: 10,),
          Text(""),
          FlatButton(
            child: Text("View on Map"),
            textColor: Theme.of(context).primaryColor,
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
