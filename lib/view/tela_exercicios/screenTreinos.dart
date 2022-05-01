import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/cardTreino.dart';

class ScreenTreinos extends StatefulWidget{
  const ScreenTreinos({Key? key}) : super(key: key);
  
@override
  State<ScreenTreinos> createState() => _ScreenTreinosState();
}

class _ScreenTreinosState extends State<ScreenTreinos>{
  List<Widget> newCards = [];
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
              ]),
              for (Widget newWidget in newCards)
                newWidget,
            ]
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30, bottom: 30),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
                onPressed: (){
                  setState(() {
                    newCards.add(CardWidget(nomeTreino: "Novo Treino", exercicioRep: []));
                  });
                },
              ),
            ),
          ),
      ])
    );
  }
  
}

