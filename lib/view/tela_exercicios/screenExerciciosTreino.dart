import 'package:flutter/material.dart';
import 'package:prog_mobile/controller/listaExercicios.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/buttonDelete.dart';
import 'package:prog_mobile/widgets/drawer.dart';

class ScreenExerciciosTreino extends StatefulWidget{
  const ScreenExerciciosTreino({Key? key}) : super(key: key);

  @override
  State<ScreenExerciciosTreino> createState() => _ScreenExerciciosTreinoState();
}

class _ScreenExerciciosTreinoState extends State<ScreenExerciciosTreino>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Align(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 30), 
              child: Text(
                "Treino - PERNAS",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            Card(
              child: ListTile(
                leading: iconeExercicio(ExercicioIsolado("Leg Press", "Perna")),
                title: Text("LegPress"),
                trailing: ButtonDelete(),
              )
            ),
            Card(
              child: ListTile(
                leading: iconeExercicio(ExercicioIsolado("Cadeira Extensora", "Perna")),
                title: Text("Cadeira Extensora"),
                trailing: ButtonDelete(),
              )
            ),
            Card(
              child: ListTile(
                leading: iconeExercicio(ExercicioIsolado("Cadeira Flexora", "Perna")),
                title: Text("Cadeira Flexora"),
                trailing: ButtonDelete(),
              )
            ),
          ]
        )
      ),
    );
  } 
}