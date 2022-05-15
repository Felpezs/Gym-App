import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/buttons/floatingButton.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/drawer.dart';
import '../../../widgets/cardTreino.dart';

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
      appBar: MyAppBar(context, title: "Treino"),
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
              CardWidget(nomeTreino: "PERNAS", route: "/treinos/exercicios_treino" ,exercicioRep: const [
                    "3 x Leg Press",
                    "3 x Cadeira Extensora",
                    "3 x Cadeira"
              ]),
              CardWidget(nomeTreino: "COSTAS", route: "/treinos/exercicios_treino",  exercicioRep: const [
                    "3 x Remada Curvada",
                    "3 x Puxada Triângulo",
                    "3 x Voador Dorsal"
              ]),
              CardWidget(nomeTreino: "PEITO", route: "/treinos/exercicios_treino",  exercicioRep: const [
                    "3 x Supino Reto",
              ]),
              for (Widget newWidget in newCards)
                newWidget,
            ]
          ),
          FloatingButton(
            onpressed: () { 
              setState(() {
                newCards.add(CardWidget(nomeTreino: "Novo Treino", route: "/treinos/exercicios_treino", exercicioRep: []));
              });
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                content: Text("Treino Adicionado"),
                ));
            })
      ])
    );
  }
  
}

