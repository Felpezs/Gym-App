import 'package:flutter/material.dart';

class ExercicioIsolado {
  final String nomeExercicio;
  final String categoriaExercicio;

  ExercicioIsolado(this.nomeExercicio, this.categoriaExercicio);
}

Widget iconeExercicio(ExercicioIsolado exercicioIsolado) {
  return Tab(
    icon: Image.asset(
      imagemCategoria(exercicioIsolado),
      width: 30,
      height: 30,
    ),
  );
}

//Recebe um obj ExercicioIsolado e define qual ícone de imagem será apresentado na tela
imagemCategoria(ExercicioIsolado exercicioIsolado) {
  if (exercicioIsolado.categoriaExercicio == "Perna") {
    return "assets/images/perna.png";
  } else if (exercicioIsolado.categoriaExercicio == "Braço") {
    return "assets/images/braco.png";
  } else if (exercicioIsolado.categoriaExercicio == "Peito") {
    return "assets/images/peito.png";
  } else if (exercicioIsolado.categoriaExercicio == "Costas") {
    return "assets/images/costas.png";
  } else if (exercicioIsolado.categoriaExercicio == "Ombro") {
    return "assets/images/ombro.png";
  } else {
    return "assets/images/ronnieColleman.png";
  }
}
