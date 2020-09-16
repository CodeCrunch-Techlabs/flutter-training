import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:traveldairy/Model/Place.dart';
import 'package:traveldairy/Helpers/Db_Helper.dart';

class GreatPlaces extends ChangeNotifier {
  List<Place> items = [];

  List<Place> get getitems {
    return [...items];
  }


  Place findById(String id){
    return items.firstWhere((place) => place.id == id );
  }

  void addPlace(
    String title,
    File pickedImage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: pickedImage,
        location: null);
    items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null),).toList();
    notifyListeners();
  }
}
