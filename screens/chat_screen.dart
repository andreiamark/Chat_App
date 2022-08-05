import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../chats/messages.dart';
import '../chats/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget{
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  // initState()  {
  //   final fbm = FirebaseMessaging.instance;
  //   fbm.requestPermission();
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings =  messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
        DropdownButton(icon: Icon(
            Icons.more_vert,
            color:Theme.of(context).primaryIconTheme.color,
        ),
          items: [
            DropdownMenuItem(
              child:
               Container(
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8,),
                    Text('Logout'),
                  ],
                ),
               ),
              value: 'logout',
            ),
          ],
          onChanged: (itemIdentifier) {
            if(itemIdentifier == 'logout'){
            FirebaseAuth.instance.signOut();
            }
          },
        ),
      ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
  );

  }
}