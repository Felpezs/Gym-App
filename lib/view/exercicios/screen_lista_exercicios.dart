import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/model/exercicioRegistrado.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';

import '../../bloc/monitor_exercicioRegistrado/monitor_bloc.dart';
import '../../bloc/monitor_exercicioRegistrado/monitor_state.dart';
import '../../model/colecaoExercicio.dart';
import 'screen_criar_exercicio.dart';

class ScreenListaExercicios extends StatelessWidget {
  const ScreenListaExercicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: "Exercícios"),
      drawer: MyDrawer(),
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
          BlocBuilder<MonitorBloc, MonitorState>(
            builder: (context, state) => Expanded(
                child: getListViewDosExercicios(state.colecaoExercicio)),
          ),
        ],
      ),
    );
  }
}

ListView getListViewDosExercicios(ColecaoExercicio colecaoExercicio) {
  return ListView.builder(
      itemCount: colecaoExercicio.length(),
      itemBuilder: (context, position) => ListTile(
            leading:
                iconeExercicio2(colecaoExercicio.getExercicioAtIndex(position)),
            title: Text(colecaoExercicio
                .getExercicioAtIndex(position)
                .nomeExercicio
                .toString()),
            subtitle: Text(
                (colecaoExercicio.getExercicioAtIndex(position).nomeCategoria)
                    .toString()),
          ));
}

Widget iconeExercicio2(ExercicioRegistrado exercicioRegistrado) {
  return Tab(
    icon: Image.asset(
      imagemCategoria2(exercicioRegistrado),
      width: 30,
      height: 30,
    ),
  );
}

//Recebe um obj ExercicioIsolado e define qual ícone de imagem será apresentado na tela
imagemCategoria2(ExercicioRegistrado exercicioRegistrado) {
  if (exercicioRegistrado.nomeCategoria == "Perna") {
    return "assets/images/perna.png";
  } else if (exercicioRegistrado.nomeCategoria == "Braço") {
    return "assets/images/braco.png";
  } else if (exercicioRegistrado.nomeCategoria == "Peito") {
    return "assets/images/peito.png";
  } else if (exercicioRegistrado.nomeCategoria == "Costas") {
    return "assets/images/costas.png";
  } else if (exercicioRegistrado.nomeCategoria == "Ombro") {
    return "assets/images/ombro.png";
  } else {
    return "assets/images/ronnieColleman.png";
  }
}
