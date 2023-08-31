import 'package:firebase_auth/firebase_auth.dart';
import 'package:xbetone/apis/user_api.dart';
import 'package:xbetone/models/user.dart' as u;

class AuthApi {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp(u.User user, String password) async {
    var cred = await auth.createUserWithEmailAndPassword(
      email: user.phone + "@xbet.com",
      password: password,
    );

    await UserApi().createUser(user, "${cred.user?.uid}");
  }

  Future<u.User> login(String phone, String password) async {
    var cred = await auth.signInWithEmailAndPassword(
      email: "$phone@xbet.com",
      password: password,
    );
    return UserApi().getOneUserSync("${cred.user?.uid}");
  }

  Future deconnect() async {
    await auth.signOut();
  }
}
