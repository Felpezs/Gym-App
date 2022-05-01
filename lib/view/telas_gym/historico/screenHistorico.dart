import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import '../../../widgets/cardTreino.dart';

class ScreenHistorico extends StatelessWidget{
  const ScreenHistorico({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                    child: Text(
                      "HISTÓRICO DE TREINOS",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              CardWidget(nomeTreino: "PERNAS", route: "/treinos/historico/historico_treino", exercicioRep: const [
                    "3 x Leg Press",
                    "3 x Cadeira Extensora",
                    "3 x Cadeira"
              ]),
              CardWidget(nomeTreino: "COSTAS", route: "/treinos/historico/historico_treino", exercicioRep: const [
                    "3 x Remada Curvada",
                    "3 x Puxada Triângulo",
                    "3 x Voador Dorsal"
              ]),
              CardWidget(nomeTreino: "PEITO", route: "/treinos/historico/historico_treino", exercicioRep: const [
                    "3 x Supino Reto",
              ]),
          ],
        ),
      ),
    );
  }
}