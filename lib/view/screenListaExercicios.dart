import 'package:flutter/material.dart';

import '../controller/listaExercicios.dart';

class screenListaExercicios extends StatelessWidget {
  const screenListaExercicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          itemExercicio(
            ExercicioIsolado('Abdutora', 'Perna'),
          ),
          itemExercicio(
            ExercicioIsolado('Rosca Direta', 'Braço'),
          ),
          itemExercicio(
            ExercicioIsolado('Rosca Direta', 'Ombro'),
          ),
          itemExercicio(
            ExercicioIsolado('Rosca Direta', 'Peito'),
          ),
          itemExercicio(
            ExercicioIsolado('Rosca Direta', 'Costas'),
          ),
          itemExercicio(
            ExercicioIsolado('Rosca Direta', 'ASAS'),
          ),
        ],
      ),
    );
  }
}

class itemExercicio extends StatelessWidget {
  final ExercicioIsolado _exercicioIsolado;
  itemExercicio(this._exercicioIsolado);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: iconeExercicio(context, _exercicioIsolado),
        title: Text(_exercicioIsolado.nomeExercicio.toString()),
      ),
    );
  }
}
