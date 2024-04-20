import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String userId;
  final String password;
  UserModel({required this.password,
       required this.userId,
      required this.email,});

  // constructor fromSnapShot to get data from firebase
  // documentSnapshot is place the store data in cloudfirestore
  factory UserModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel(
        password:snapshot['password'] ,
        email: snapshot['email'],
        userId: snapshot['userId']);
  }
  // method toSnapShot to send data to cloudfirestore
  Map<String, dynamic> toSnapShot() {
    return {
      'userId': userId,
      'email': email,
      'password':password
    };
  }
}
