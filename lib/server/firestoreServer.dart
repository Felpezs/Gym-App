import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_mobile/model/colecaoExercicio.dart';
import 'package:prog_mobile/model/exercicioRegistrado.dart';
import 'package:prog_mobile/model/user_model.dart';

class FirestoreServer {
  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference exerciciosCollection =
      FirebaseFirestore.instance.collection('exercicios');

  //RELATIVO A USUARIO
  Future<UserModel> getUser() async {
    DocumentSnapshot userInfo = await userCollection
        .doc(uid)
        .collection('my_info')
        .doc('exercicioRegistrado')
        .get();
    UserModel userModel = UserModel.fromMap(userInfo.data());
    return userModel;
  }

  Future<void> insertUserInfo(
      {required String username,
      required String genero,
      required double altura,
      required double peso}) async {
    await userCollection
        .doc(uid)
        .collection('my_info')
        .doc('personal_info')
        .set({
      "username": username,
      "genero": genero,
      "altura": altura,
      "peso": peso,
    });
  }

  Future<void> updateUserInfo({required UserModel userModel}) async {
    await userCollection
        .doc(uid)
        .collection('my_info')
        .doc('personal_info')
        .update({
      "username": userModel.username,
      "genero": userModel.genero,
      "altura": userModel.altura,
      "peso": userModel.peso,
    });
  }

  //RELATIVO A EXERCICIO REGISTRADOS

  Future<void> insertExercicioInfo(
      ExercicioRegistrado exercicioRegistrado) async {
    await exerciciosCollection.add({
      "nomeExercicio": exercicioRegistrado.nomeExercicio,
      "nomeCategoria": exercicioRegistrado.nomeCategoria,
    });
  }

  Future<ColecaoExercicio> getExercicioRegistrado() async {
    QuerySnapshot snapshot = await exerciciosCollection.get();

    return colecaoFromSnapshot(snapshot);
  }

  ColecaoExercicio colecaoFromSnapshot(QuerySnapshot snapshot) {
    ColecaoExercicio colecaoExercicio = ColecaoExercicio();
    for (var doc in snapshot.docs) {
      ExercicioRegistrado exercicioRegistrado =
          ExercicioRegistrado.fromMap(doc.data());
      colecaoExercicio.insertExercicioOfId(doc.id, exercicioRegistrado);
    }
    return colecaoExercicio;
  }

  Stream get stream {
    return exerciciosCollection.snapshots().map(colecaoFromSnapshot);
  }
}
