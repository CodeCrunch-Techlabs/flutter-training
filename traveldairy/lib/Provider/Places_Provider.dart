import 'package:flutter/cupertino.dart';

import 'package:traveldairy/Model/Place.dart';

class GreatPlaces extends ChangeNotifier{

      List<Place> items = [];

      List<Place> get getitems{
        return [...items];
      }



}