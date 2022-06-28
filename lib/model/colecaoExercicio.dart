import 'package:prog_mobile/model/exercicioRegistrado.dart';

class ColecaoExercicio {
  List<String> idList = [];
  List<ExercicioRegistrado> listaExercicios = [];

  ColecaoExercicio() {
    idList = [];
    listaExercicios = [];
  }

  int length() {
    return idList.length;
  }

  ExercicioRegistrado getExercicioAtIndex(int index) {
    return listaExercicios[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertExercicioOfId(
      String id, ExercicioRegistrado exercicioRegistrado) {
    int index = getIndexOfId(id);
    if (index != -1) {
      listaExercicios[index] = exercicioRegistrado;
    } else {
      idList.add(id);
      listaExercicios.add(exercicioRegistrado);
    }
  }

  updateExercicioOfId(String id, ExercicioRegistrado exercicioRegistrado) {
    int index = getIndexOfId(id);
    if (index != -1) {
      listaExercicios[index] = exercicioRegistrado;
    }
  }

  deleteExercicioOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      listaExercicios.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertExercicioOfId(String id, ExercicioRegistrado exercicioRegistrado) {
    idList.add(id);
    listaExercicios.add(exercicioRegistrado);
  }
}
