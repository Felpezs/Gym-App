import 'package:flutter/material.dart';

class screenAdicionarExercicio extends StatelessWidget {
  const screenAdicionarExercicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Exercícios Registrados",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
    );
  }
}
