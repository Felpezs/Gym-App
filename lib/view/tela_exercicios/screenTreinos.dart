import 'package:flutter/material.dart';
import '../../widgets/appBarWidget.dart';
import '../../widgets/drawerWidget.dart';
import '../../widgets/cardTreinoWidget.dart';

class ScreenTreinos extends StatelessWidget{
  const ScreenTreinos({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                  child: Text(
                    "TREINOS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              CardWidget(nomeTreino: "PERNAS", exercicioRep: const [
                    "3 x Leg Press",
                    "3 x Cadeira Extensora",
                    "3 x Cadeira"
              ]),
              CardWidget(nomeTreino: "COSTAS", exercicioRep: const [
                    "3 x Remada Curvada",
                    "3 x Puxada Triângulo",
                    "3 x Voador Dorsal"
              ]),
              CardWidget(nomeTreino: "PEITO", exercicioRep: const [
                    "3 x Supino Reto",
              ])
            ]
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30, bottom: 30),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
                onPressed: (() {  
                }),
                     ),
            ),
          ),
      ])
    );
  }
}

