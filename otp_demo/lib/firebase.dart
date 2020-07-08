import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {

  final firestoreInstance = Firestore.instance;


  void createRecord(){

    firestoreInstance.collection("users").add(
        {
          "Name" : "john",
          "Age" : 50,
        }).then((value){
      print(value.documentID);
    });

  }


}