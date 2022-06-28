class ExercicioRegistrado {
  String? _nomeExercicio;
  String? _nomeCategoria;

  ExercicioRegistrado();

  ExercicioRegistrado.withData({nomeExercicio = "", nomeCategoria = ""}) {
    _nomeExercicio = nomeExercicio;
    _nomeCategoria = nomeCategoria;
  }

  ExercicioRegistrado.fromMap(map) {
    _nomeExercicio = map["nomeExercicio"];
    _nomeCategoria = map["nomeCategoria"];
  }

  String? get nomeExercicio {
    return _nomeExercicio;
  }

  String? get nomeCategoria {
    return _nomeCategoria;
  }

  set nomeCategoria(String? value) {
    _nomeCategoria = value;
  }

  set nomeExercicio(String? value) {
    _nomeExercicio = value;
  }
}
