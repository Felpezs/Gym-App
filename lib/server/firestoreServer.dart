import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prog_mobile/model/user_model.dart';

class FirestoreServer{

  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUser() async{
    DocumentSnapshot userInfo = await userCollection.doc(uid).collection('my_info').doc('personal_info').get();
    UserModel user = UserModel.fromMap(userInfo.data());
    return user;
  }

  Future<void> insertUserInfo({required String username, required String genero, required double altura, required double peso}) async{
    await userCollection.doc(uid).collection('my_info').doc('personal_info').set({
        "username": username,
        "genero": genero,
        "altura": altura,
        "peso": peso,
      });
  }
}

