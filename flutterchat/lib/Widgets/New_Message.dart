import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final controller = new TextEditingController();
  var enteredMessage = '';

  void sendMessage() async{
    FocusScope.of(context).unfocus();
   final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .document(user.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username':userData.data()['username'],
      'userImage': userData.data()['image_url']
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
            onChanged: (value){
              enteredMessage = value;
            },),
          ),
          IconButton(icon:Icon(Icons.send,color: Theme.of(context).primaryColor,) ,onPressed: (){
            enteredMessage.trim().isEmpty ? null : sendMessage();
          },)

        ],
      ),
    );
  }
}
