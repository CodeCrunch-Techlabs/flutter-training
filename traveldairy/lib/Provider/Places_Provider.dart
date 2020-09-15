import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:traveldairy/Model/Place.dart';

class GreatPlaces extends ChangeNotifier{

      List<Place> items = [];

      List<Place> get getitems{
        return [...items];
      }

   void addPlace( String title, File pickedImage,){
        final newPlace = Place(
          id: DateTime.now().toString(),
          title: title,
          image: pickedImage,
          location: null
        );
     items.add(newPlace);
     notifyListeners();
   }
}