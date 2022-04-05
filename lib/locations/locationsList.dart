
import 'package:flutter/material.dart';
import 'package:lunch_partner/controller/locationController.dart';

class LocationList extends StatefulWidget {
  const LocationList({Key? key}) : super(key:key);

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList>{
  late LocationController db;
  List docs = [];

  initialise() {
    db = LocationController();
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
      backgroundColor: Color.fromRGBO(177, 219, 238, 1),
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text('Location List')
      ),
      body:ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: (){},
                contentPadding: EdgeInsets.only(right: 30,left: 36),
                title: Text(docs[index]['name']),
                trailing: Text(docs[index]['city']),
              ),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}