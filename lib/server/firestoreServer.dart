import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prog_mobile/model/treino.dart';
import 'package:prog_mobile/model/treinos.dart';
import 'package:prog_mobile/model/user_model.dart';

import '../model/colecaoExercicio.dart';
import '../model/exercicio.dart';
import '../model/exercicioRegistrado.dart';
import '../model/exercicios.dart';
import '../model/serie.dart';

class FirestoreServer {
  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;
  String? idTreino;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference exerciciosCollection =
      FirebaseFirestore.instance.collection('exercicios');

  Future<UserModel> getUser() async {
    DocumentSnapshot userInfo = await userCollection
        .doc(uid)
        .collection('my_info')
        .doc('personal_info')
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

  Future<void> insertTreino(String nomeTreino) async {
    await userCollection
        .doc(uid)
        .collection('treino')
        .doc()
        .set({'nomeTreino': nomeTreino});
  }

  TreinoCollection _treinoListFromSnapshot(QuerySnapshot snapshot) {
    TreinoCollection treinoCollection = TreinoCollection();
    for (var doc in snapshot.docs) {
      Treino treino = Treino.fromMap(doc.data());
      treinoCollection.insertTreinoOfId(doc.id, treino);
    }
    return treinoCollection;
  }

  ExercicioCollection _exercicioListFromSnapshot(
      QuerySnapshot snapshotExercicio) {
    ExercicioCollection exercicioCollection = ExercicioCollection();
    for (var doc in snapshotExercicio.docs) {
      Exercicio exercicio = Exercicio.fromMap(doc.data());
      exercicioCollection.insertExercicioOfId(doc.id, exercicio);
    }
    return exercicioCollection;
  }

  Future<TreinoCollection> getTreinos() async {
    QuerySnapshot snapshot =
        await userCollection.doc(uid).collection('treino').get();
    return _treinoListFromSnapshot(snapshot);
  }

  Future<ExercicioCollection> getExercicios() async {
    QuerySnapshot snapshot = await userCollection
        .doc(uid)
        .collection('treino')
        .doc(idTreino)
        .collection('exercicio')
        .get();
    return _exercicioListFromSnapshot(snapshot);
  }

  Future<void> insertExercicioTreino(Exercicio exercicio) async{
    await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').add({
      "categoria": exercicio.categoria,
      "nomeExercicio": exercicio.nomeExercicio
    });
  }

  Future<void> deleteExercicioTreino(String exercicioId) async{
    await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').doc(exercicioId).delete();
  }

  Future<void> insertExecucaoTreino(String exercicioId, String carga, String repeticao, String serie) async{
    await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').doc(exercicioId).collection('serie').doc().set({
      "serie": serie,
      "carga": carga,
      "repeticao": repeticao,
    });
  }

  Future<void> updateExecucaoTreino(String exercicioId, String carga, String repeticao, String indexSerie) async{
    QuerySnapshot snapshot = await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').doc(exercicioId).collection('serie').get();

    for(var doc in snapshot.docs){
      Serie serie = Serie.fromMap(doc.data());
      if(serie.id == indexSerie){
         await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').doc(exercicioId).collection('serie').doc(serie.id).set({
          "serie": indexSerie,
          "carga": carga,
          "repeticao": repeticao
         });
      }
    }
  }

  Stream get streamExercicio {
    return userCollection
        .doc(uid)
        .collection('treino')
        .doc(idTreino)
        .collection('exercicio')
        .snapshots()
        .map(_exercicioListFromSnapshot);
  }

  Stream get streamTreino {
    return userCollection
        .doc(uid)
        .collection('treino')
        .snapshots()
        .map(_treinoListFromSnapshot);
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
