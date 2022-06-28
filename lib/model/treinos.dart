import 'package:prog_mobile/model/treino.dart';

class TreinoCollection{
  List<String> idList = [];
  List<Treino> treinoList = [];

  TreinoCollection(){
    idList = [];
    treinoList = [];
  }

  insertTreinoOfId(String id, Treino treino){
    idList.add(id);
    treinoList.add(treino);
  }

  int length() {
    return idList.length;
  }

  Treino getTreinoAtIndex(int index) {
    return treinoList[index];
  }
}