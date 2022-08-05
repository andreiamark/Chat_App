import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class MessageBubble extends StatelessWidget {
  MessageBubble(
      this.message,
      this.username,
      this.userImage,
      this.isMe,
      {required this.key});

  final Key key;
  final String message;
  final String username;
  final String userImage;
  final bool isMe;



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(),
        Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.grey[200] : Theme
                  .of(context)
                  .primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            width: 140,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isMe
                        ? Colors.black
                        : Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe
                        ? Colors.black
                        : Theme
                        .of(context)
                        .primaryColor,
                  ),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
              ],
            ),
          ),
        ],
    ),
        Positioned(
          top: -10,
          left: isMe ? null : 140,
          right: isMe ? 120 : null,
          child: CircleAvatar(backgroundImage: NetworkImage(userImage)),
        ),
      ],
      clipBehavior: Clip.antiAlias,
    );
  }
}
