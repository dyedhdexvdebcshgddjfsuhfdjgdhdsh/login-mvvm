import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_task/models/user_model.dart';
import 'package:login_task/repository/login_repo.dart';

class AuthenticationMethod implements LoginRepository{
  //create instance from FirebaseAuthentication
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');


  Future signInAuth({required String email, required String password}) async {
    String response = 'some error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(
            userId: userCredential.user!.uid, email: email, password: password);
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userModel.toSnapShot());

        response = 'success';
      } else {
        print(response);
      }
    } on Exception catch (error) {
      print('Error : ${error.toString()}');
    }
  }
}
