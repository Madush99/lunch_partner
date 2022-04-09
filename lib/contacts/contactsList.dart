import 'package:flutter/material.dart';
import 'package:lunch_partner/contacts/addContact.dart';
import 'package:lunch_partner/contacts/viewContact.dart';
import 'package:lunch_partner/home.dart';
import '../controller/contactController.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key:key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList>{
  late ContactController db;
  List docs = [];

  initialise() {
    db = ContactController();
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
          title: Text('Contact List')
      ),
      body:ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewContact(contact:docs[index],db:db)));
                },
                contentPadding: EdgeInsets.only(right: 30,left: 36),
                title: Text(docs[index]['name']),
                trailing: Text(docs[index]['number']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddContact(db: db)))
            .then((value) => {
          if(value != null) {
            initialise()
          }
        });},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );// This trailing comma makes auto-formatting nicer for build methods.


  }

  _goBack(BuildContext context) {
    Navigator.pop(context);
  }


}
