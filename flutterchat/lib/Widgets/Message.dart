import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutterchat/Widgets/Message_Bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapShot) {
          final user = FirebaseAuth.instance.currentUser;
          if (chatSnapShot.connectionState == ConnectionState.waiting ||
              user == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              reverse: true,
              itemCount: chatSnapShot.data.documents.length,
              itemBuilder: (ctx, index) => MessageBubble(
                    user.uid,
                  chatSnapShot.data.documents[index].get('text'),
                  chatSnapShot.data.documents[index].get('userId') == user.uid,
              ));
        });
  }
}
