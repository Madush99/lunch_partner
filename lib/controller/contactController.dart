import 'package:cloud_firestore/cloud_firestore.dart';

class ContactController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future read() async {
    QuerySnapshot querySnapshot;
    List contacts = [];

    try{
      querySnapshot = await firestore.collection('contacts').orderBy('timestamps').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id":doc.id, "name": doc['name'], "number":doc["number"] };
          contacts.add(a);
        }
        return contacts;
      }
    }catch(e){
      print(e);
    }
  }

}