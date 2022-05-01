import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import 'screenCriarExercicio.dart';
import '../../controller/listaExercicios.dart';

class ScreenListaExercicios extends StatelessWidget {
  const ScreenListaExercicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: "Exercícios"),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ScreenCriarExercicio()),
          );
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Text("Exercícios Registrados",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          Container(
            height: 20,
          ),
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
        leading: iconeExercicio(_exercicioIsolado),
        title: Text(_exercicioIsolado.nomeExercicio.toString()),
      ),
    );
  }
}
