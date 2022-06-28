import 'package:flutter/material.dart';
import 'package:prog_mobile/model/exercicio.dart';

Widget iconeExercicio({required Exercicio exercicio}) {
  return Tab(
    icon: Image.asset(
      imagemCategoria(exercicio.categoria),
      width: 30,
      height: 30,
    ),
  );
}

imagemCategoria(String categoria) {
  if (categoria == "Perna") {
    return "assets/images/perna.png";
  } else if (categoria == "Braço") {
    return "assets/images/braco.png";
  } else if (categoria == "Peito") {
    return "assets/images/peito.png";
  } else if (categoria == "Costas") {
    return "assets/images/costas.png";
  } else if (categoria == "Ombro") {
    return "assets/images/ombro.png";
  } else {
    return "assets/images/ronnieColleman.png";
  }
}
