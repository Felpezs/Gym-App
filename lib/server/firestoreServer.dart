import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_mobile/model/user_model.dart';

class FirestoreServer{

  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUser() async{
    QuerySnapshot userInfo = await userCollection.doc(uid).collection('my_info').get();
    //Iterar pelos documentos para construir o obj
    //UserModel userModel = UserModel.fromMap(userInfo.data());
    return UserModel();
  }

  Future<void> insertUserInfo({required String username, required String genero, required double altura, required double peso}) async{
    userCollection.doc(uid).collection('my_info').add({
        "username": username,
        "genero": genero,
        "altura": altura,
        "peso": peso,
      });
  }
}

