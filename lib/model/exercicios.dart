import 'package:prog_mobile/model/exercicio.dart';

class ExercicioCollection{
  List<String> idList = [];
  List<Exercicio> exercicioList = [];

  ExercicioCollection(){
    idList = [];
    exercicioList = [];
  }

  insertExercicioOfId(String id, Exercicio exercicio){
    idList.add(id);
    exercicioList.add(exercicio);
  }

  int length() {
    return idList.length;
  }

  Exercicio getExercicioAtIndex(int index) {
    return exercicioList[index];
  }
}