import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MessageBubble extends StatelessWidget {
  MessageBubble(this.userId, this.message, this.isMe, );

  final String userId;
  final String message;
  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color:isMe ? Colors.grey[300] :  Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          width: 130,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').document(userId).get(),
                builder: (context, snapShot){
                  if(snapShot.connectionState == ConnectionState.waiting){
                    return Text("Loading..");
                  }
                return Text(snapShot.data.data()["username"], style: TextStyle(fontWeight: FontWeight.bold),);
              },),
              Text(message, style: TextStyle(
                color: isMe ? Colors.black : Theme.of(context).accentTextTheme.title.color,
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
