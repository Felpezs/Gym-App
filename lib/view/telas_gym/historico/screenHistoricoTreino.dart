import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import '../../../controller/listaExercicios.dart';

class ScreenHistoricoTreino extends StatefulWidget{
  const ScreenHistoricoTreino({Key? key}) : super(key: key);

  @override
  State<ScreenHistoricoTreino> createState() => _ScreenHistoricoTreino();
}

class _ScreenHistoricoTreino extends State<ScreenHistoricoTreino>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context, title: "Historico"),
      drawer: MyDrawer(),
      body: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                child: Text(
                  "TREINO - PERNAS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView( 
                children: [
                  ListTile(
                    leading: iconeExercicio(ExercicioIsolado("Leg Press", "Perna")),
                    title: Text("LegPress"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Column(
                            children: const [
                              Text("Série", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                              Text("1. 170 kg x 10 repetições"),
                              Text("2. 190 kg x 10 repetições"),
                              Text("3. 200 kg x 10 repetições"),
                            ],
                          ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Column(
                          children: const[
                            Text("Volume Total", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                            Text("5600 kg")
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(color: Colors.blue, thickness: 2),
                  ListTile(
                    leading: iconeExercicio(ExercicioIsolado("Cadeira Extensora", "Perna")),
                    title: Text("Cadeira Extensora"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Column(
                            children: const [
                              Text("Série", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                              Text("1. 50 kg x 10 repetições"),
                              Text("2. 55 kg x 10 repetições"),
                              Text("3. 60 kg x 10 repetições"),
                            ],
                          ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Column(
                          children: const[
                            Text("Volume Total", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                            Text("1650 kg")
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(color: Colors.blue, thickness: 2),
                   ListTile(
                    leading: iconeExercicio(ExercicioIsolado("Cadeira Extensora", "Perna")),
                    title: Text("Cadeira Flexora"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Column(
                            children: const [
                              Text("Série", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                              Text("1. 40 kg x 10 repetições"),
                              Text("2. 55 kg x 6 repetições"),
                              Text("3. 55 kg x 8 repetições"),
                            ],
                          ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Column(
                          children: const[
                            Text("Volume Total", style: TextStyle(color: Color.fromRGBO(117, 117, 117, 100)),),
                            Text("1170 kg")
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(color: Colors.blue, thickness: 2),
                ],
              )
            )

        ],
      ),
    );
  }
}