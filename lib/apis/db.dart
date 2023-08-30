import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xbetone/models/competition.dart';

class Db {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Competition>> getData() {
    var t = db
        .collection("competitions")
        .snapshots()
        .map((event) => event.docs.map((e) {
              return Competition.fromJson(e.data());
            }).toList());

    return t;
  }
}
