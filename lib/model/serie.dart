class Serie{
  String? id;
  String? carga;
  String? repeticao;

  Serie();

  Serie.fromMap(map){
    id = map["serie"];
    carga = map["carga"];
    repeticao = map["repeticao"];
  }
}
