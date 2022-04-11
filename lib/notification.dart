import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunch_partner/home.dart';
import 'package:lunch_partner/registration.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'model/userModel.dart';
import 'notificationApi.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<String> recipents = ["0766663881"];
  String message = "this is a message";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text("send SMS"),
              onPressed: () {
                _sendSMS(message, recipents);
              },

            )
        ),
      ),
    );
  }


//login function

}
void _sendSMS(String message, List<String> recipents, ) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError ((onError) {
    print(onError);
  });
  print(_result);
}