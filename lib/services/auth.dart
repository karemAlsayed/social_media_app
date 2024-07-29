import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  signUp({
    required String email,
    required String password,
    required String username,
    required String name,
  }) async {
    // ignore: unused_local_variable
    String res = 'some error';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          name.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(
            followers: [],
            following: [],
            userBio: '',
            userEmail: email,
            userId: userCredential.user!.uid,
            userName: username,
            userProfilePicture: '');
        users.doc(userCredential.user!.uid).set(userModel.toJson());
        res = 'success';
      } else {
        res = 'Enter All Fields !!';
      }
    } on Exception catch (e) {
      return e.toString();
    }
    return res;
  }
}
