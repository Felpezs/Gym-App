import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_event.dart';
import 'package:prog_mobile/bloc/bloc_gym_info/gym_info_event.dart';
import 'package:prog_mobile/model/treino.dart';
import 'package:prog_mobile/model/treinos.dart';
import 'package:prog_mobile/model/user_model.dart';

import '../model/exercicio.dart';
import '../model/exercicios.dart';

class FirestoreServer{

  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();

  String? uid;
  String? idTreino;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUser() async{
    DocumentSnapshot userInfo = await userCollection.doc(uid).collection('my_info').doc('personal_info').get();
    UserModel userModel = UserModel.fromMap(userInfo.data());
    return userModel;
  }

  Future<void> insertUserInfo({required String username, required String genero, required double altura, required double peso}) async{
    await userCollection.doc(uid).collection('my_info').doc('personal_info').set({
        "username": username,
        "genero": genero,
        "altura": altura,
        "peso": peso,
      });
  }

  Future<void> updateUserInfo({required UserModel userModel}) async{
    await userCollection.doc(uid).collection('my_info').doc('personal_info').update({
      "username": userModel.username,
      "genero": userModel.genero,
      "altura": userModel.altura,
      "peso": userModel.peso,
    });
  }

  Future<void> insertTreino(String nomeTreino) async{
    await userCollection.doc(uid).collection('treino').doc().set({
      'nomeTreino': nomeTreino
    });
  }

  TreinoCollection _treinoListFromSnapshot(QuerySnapshot snapshot){
  	TreinoCollection treinoCollection = TreinoCollection();
    for (var doc in snapshot.docs) {
      Treino treino = Treino.fromMap(doc.data());
      treinoCollection.insertTreinoOfId(doc.id, treino);
    }
    return treinoCollection;
  }

  ExercicioCollection _exercicioListFromSnapshot(QuerySnapshot snapshotExercicio){
    ExercicioCollection exercicioCollection = ExercicioCollection();
    for(var doc in snapshotExercicio.docs){
      Exercicio exercicio = Exercicio.fromMap(doc.data());
      exercicioCollection.insertExercicioOfId(doc.id, exercicio);
    }
    return exercicioCollection;
  }

  Future<TreinoCollection> getTreinos() async{
    QuerySnapshot snapshot = await userCollection.doc(uid).collection('treino').get();
    return _treinoListFromSnapshot(snapshot);
  }

  Future<ExercicioCollection> getExercicios() async{
    QuerySnapshot snapshot = await userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').get();
    return _exercicioListFromSnapshot(snapshot);
  }

  Stream get streamExercicio {
    return userCollection.doc(uid).collection('treino').doc(idTreino).collection('exercicio').snapshots().map(_exercicioListFromSnapshot);
  }

  Stream get streamTreino {
    return userCollection.doc(uid).collection('treino').snapshots().map(_treinoListFromSnapshot);
  }
}

