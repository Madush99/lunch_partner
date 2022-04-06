
import 'package:flutter/material.dart';
import 'package:lunch_partner/controller/meetingController.dart';
import 'package:lunch_partner/home.dart';

//import 'package:lunch_partner/form.dart';

class MeetingList extends StatefulWidget {
  const MeetingList({Key? key}) : super(key:key);

  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList>{
  late MeetingController  db;
  List docs = [];

  initialise() {
    db = MeetingController ();
    db.initiliase();
    db.read().then((value) => {
      setState((){
        docs = value;
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(218, 216, 216, 1),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          centerTitle: true,
          title: Text('Meeting List')
      ),
      body:ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: (){},
                contentPadding: EdgeInsets.only(right: 30,left: 36),
                title: Text(docs[index]['title']),
                trailing: Text(docs[index]['location']),

              ),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _goBack(BuildContext context) {
    Navigator.pop(context);
  }
}