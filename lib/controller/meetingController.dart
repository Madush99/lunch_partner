
import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingController {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }


  Future read() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try{
      querySnapshot = await firestore.collection('meeting').orderBy('timestamp').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {"id":doc.id, "title": doc['title'], "location":doc["location"] };
          docs.add(a);
        }
        return docs;
      }
    }catch(e){
      print(e);
    }
  }


  Future<void> create(String title, String location) async {
    try {
      await firestore.collection("meeting").add({
        'title': title,
        'location': location,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }


}