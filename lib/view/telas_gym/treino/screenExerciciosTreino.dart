import 'package:flutter/material.dart';
import 'package:prog_mobile/controller/listaExercicios.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/button.dart';
import 'package:prog_mobile/widgets/buttonDelete.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import 'package:prog_mobile/widgets/floatingButton.dart';

class ScreenExerciciosTreino extends StatefulWidget{
  const ScreenExerciciosTreino({Key? key}) : super(key: key);

  @override
  State<ScreenExerciciosTreino> createState() => _ScreenExerciciosTreinoState();
}

class _ScreenExerciciosTreinoState extends State<ScreenExerciciosTreino>{
  List<Widget> newListTile = [];

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Column(
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
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: iconeExercicio(ExercicioIsolado("Leg Press", "Perna")),
                      title: Text("LegPress"),
                      trailing: ButtonDelete(),
                    ),
                    ListTile(
                      leading: iconeExercicio(ExercicioIsolado("Cadeira Extensora", "Perna")),
                      title: Text("Cadeira Extensora"),
                      trailing: ButtonDelete(),
                    ),
                    ListTile(
                      leading: iconeExercicio(ExercicioIsolado("Cadeira Flexora", "Perna")),
                      title: Text("Cadeira Flexora"),
                      trailing: ButtonDelete(),
                    ),
                    for (Widget newWidget in newListTile)
                      newWidget,
                  ]  
                ),
              ),
            ]
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
            setState(() {
              newListTile.add(
                ListTile(
                    leading: iconeExercicio(ExercicioIsolado("Cadeira Flexora", "Perna")),
                    title: Text("Cadeira Flexora"),
                    trailing: ButtonDelete(),
                  )
              );
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                content: Text("Exercicio Adicionado"),
                ));
            });
        })
      ]),
    );
  } 
}