
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunch_partner/controller/meetingController.dart';
import 'package:lunch_partner/meeting/datepicker.dart';
//import 'package:lunch_partner/meeting/displaydate.dart';
//import 'package:lunch_partner/meeting/timepicker.dart';
//import 'package:lunch_partner/meeting/displaydate.dart';
import 'package:lunch_partner/meeting/timepicker.dart';

class AddMeeting extends StatefulWidget {
  AddMeeting({Key? key, required this.db}) : super(key: key);
  MeetingController db;
  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(218, 216, 216, 1),
      appBar: AppBar(

        title: Text("Add Invitation"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // widget.db.delete(widget.country["id"]);
                // Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Invitation Title"),
                controller: titleController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration("Location"),
                controller: locationController,
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text('Date', style: TextStyle(fontSize: 20.0),),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: () {Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Datepicker ()));},
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text('Time', style: TextStyle(fontSize: 20.0),),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: () {Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TimePicker()));},
                ),
              ),
            ],

          ),
        ),


      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              color: Colors.black,
              onPressed: () {
                widget.db.create(titleController.text, locationController.text);
                Navigator.pop(context, true);
              },

              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              )),
        ),

      ),

    );

  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.9,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}