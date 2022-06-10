import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_mobile/model/user_model.dart';

class FirestoreServer{

  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future<UserModel> getUser() async{
    if(!(await userCollection.doc(uid).get()).exists){
      return UserModel();
    }
    DocumentSnapshot userInfo = await userCollection.doc(uid).collection('my_info').doc('personal_info').get();
    UserModel userModel = UserModel.fromMap(userInfo.data());
    return userModel;
  }
}

