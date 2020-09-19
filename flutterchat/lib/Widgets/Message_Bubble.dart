import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.userName,
    this.userImage,
    this.message,
    this.isMe,
  );

  final String userName;
  final String userImage;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
              width: 130,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !isMe ? Colors.white : Colors.black),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.title.color,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
            left: isMe ? null : 120,
            right: isMe ? 120 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            )),
      ],
    );
  }
}
