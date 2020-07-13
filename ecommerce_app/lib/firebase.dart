import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBrain{

  final firestoreInstance = Firestore.instance;

  void createUser(name, email, mobile, otp) {
    firestoreInstance
        .collection("users")
        .add({"Name": name, "Email": email, "Mobile": mobile, "OTP": otp}).then(
            (value) {
          print(value.documentID);
        });
  }


}