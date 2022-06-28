import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_bloc.dart';
import 'package:prog_mobile/src/listaExercicios.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/buttons/button.dart';
import 'package:prog_mobile/widgets/buttons/buttonDelete.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import 'package:prog_mobile/widgets/buttons/floatingButton.dart';

import '../../bloc/bloc_exercise_info/exercise_info_event.dart';
import '../../bloc/bloc_exercise_info/exercise_info_state.dart';
import '../../model/exercicios.dart';

class ScreenExerciciosTreino extends StatelessWidget{
  ScreenExerciciosTreino({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context){
    final nomeTreino = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          BlocBuilder<ExerciseInfoBloc, ExerciseInfoState>(
            builder: ((context, state) {
              if(state is ExercisesLoaded){
                return Column(
                children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 40), 
                      child: Text(
                        "Treino - ${nomeTreino}",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  Expanded(
                    child: getExercicioListView(state.exercicioCollection)
                  )               
                ],
              );
              }
              return const Text('Carregando');
            })
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 30),
              child: ButtonWidget(buttonText: "INICIAR", width: 250, onpressed: (){
                Navigator.pushNamed(context, "/treinos/exercicios_treino/executar_treino");
              }),
            ),
          ),
          FloatingButton(
            onpressed: (){
                Navigator.pushNamed(context, "/treinos/exercicios_treino/selecionar_exercicio");
              })
      ]),
      
    );
  }
}

ListView getExercicioListView(ExercicioCollection exercicioCollection) {
    return ListView.builder(
        itemCount: exercicioCollection.length(),
        itemBuilder: (context, position){
          return ListTile(
            leading: iconeExercicio(exercicio: exercicioCollection.getExercicioAtIndex(position)),
            title: Text(exercicioCollection.getExercicioAtIndex(position).nomeExercicio),
            trailing: ButtonDelete(),
          );
        }
    );
  }