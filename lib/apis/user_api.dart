import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/user.dart';

class UserApi {
  FirebaseFirestore db = FirebaseFirestore.instance;

  /// creation d'un utilisateur
  Future<void> createUser(User user, String uid) async {
    //var docId = auth.FirebaseAuth.instance.currentUser?.uid;
    print(user);
    print(uid);
    try {
      await db.collection("users").doc(uid).set(user.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// effacer user
  void deleteUser() async {
    var docId = auth.FirebaseAuth.instance.currentUser?.uid;
    try {
      await db.collection("users").doc(docId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> getAllUserSync() async {
    var data = await db.collection("users").get();
    return data.docs
        .map(
          (e) => User.fromJson(e.data()),
        )
        .toList();
  }

  Stream<User> getOneUser(String docId) {
    return db.collection("users").doc(docId).snapshots().map(
          (event) => User.fromJson(event.data()),
        );
  }

  Future<User> getOneUserSync(String docId) async {
    var data = await db.collection("users").doc(docId).get();
    return User.fromJson(data.data());
  }

  Stream<List<User>> getAllUsers() {
    return db.collection("users").snapshots().map(
          (event) => event.docs
              .map(
                (e) => User.fromJson(e.data()),
              )
              .toList(),
        );
  }
}
