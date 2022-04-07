import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunch_partner/home.dart';
import 'package:lunch_partner/registration.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
File? image;

  Future pickImage() async {
 try {
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
   if (image == null) return;

   final imageTemporary = File(image.path);
   setState(() => this.image = imageTemporary);
 } on PlatformException catch (e){
   print('Failed to pick image: $e');
 }
  }

  @override
  Widget build(BuildContext context) {

    //password field

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () => pickImage(),
          child: Text(
            "Image Upload",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   image!= null ? Image.file(image!,
                   width: 160,
                   height: 160,
                   fit: BoxFit.cover) : FlutterLogo(size: 160),
                    loginButton,

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function

}
