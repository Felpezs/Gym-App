import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_event.dart';
import 'package:prog_mobile/bloc/manage_exercicioRegistrado/manage_bloc.dart';
import 'package:prog_mobile/bloc/manage_exercicioRegistrado/manage_state.dart';
import 'package:prog_mobile/bloc/monitor_exercicioRegistrado/monitor_bloc.dart';
import 'package:prog_mobile/bloc/monitor_exercicioRegistrado/monitor_state.dart';
import 'package:prog_mobile/model/exercicio.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';

import '../../model/colecaoExercicio.dart';
import '../../model/exercicioRegistrado.dart';

class ScreenSelecionarExercicio extends StatelessWidget{
  const ScreenSelecionarExercicio({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),
      body: Column(
        children: [
           const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 70, bottom: 30),
                child: Text(
                  "EXERCÍCIOS REGISTRADOS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state){
            return Expanded(child: getListViewDosExercicios(state.colecaoExercicio),);
          })
      ]),

    );
  }

}

ListView getListViewDosExercicios(ColecaoExercicio colecaoExercicio) {
  return ListView.builder(
      itemCount: colecaoExercicio.length(),
      itemBuilder: (context, position) => ListTile(
            onTap: (){
              ExercicioRegistrado aux = colecaoExercicio.getExercicioAtIndex(position);
              Exercicio exercicio = Exercicio.withData(nomeExercicio: aux.nomeExercicio, categoria: aux.nomeCategoria);
              BlocProvider.of<ExerciseInfoBloc>(context).add(InsertExercicio(exercicio: exercicio));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Exercicio adicionado!"), 
                  backgroundColor: Colors.green, 
                  duration: Duration(seconds: 1)
                )
              );
              Navigator.pop(context);
            },
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