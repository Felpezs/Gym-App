import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import 'package:prog_mobile/src/listaExercicios.dart';
import '../../widgets/buttons/button.dart';

class ScreenExecutarTreino extends StatefulWidget{
  const ScreenExecutarTreino({Key? key}) : super(key: key);

  @override 
  State<ScreenExecutarTreino> createState() => _ScreenExecutarTreinoState();
} 

class _ScreenExecutarTreinoState extends State<ScreenExecutarTreino>{
  List<DataRow> newRow = [];

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                    child: Text(
                      "Treino - PERNAS",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
            ListTile(
                //leading: iconeExercicio(ExercicioIsolado("Leg Press", "Perna")),
                title: Text("LegPress"),
            ),
            const Divider(color: Colors.blue, thickness: 2,),
            SizedBox(
              width: 400,
              child: DataTable(
                columnSpacing: 0,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Série', 
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'Carga', 
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Center(
                        child: Text(
                          'Repetições', 
                          style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                          ),
                        ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'Concluído', 
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
                rows: [
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('170 kg')),
                      DataCell(Text('10')),
                      DataCell(
                        Checkbox(onChanged: (bool? newValue){}, value: true,)
                      ),
                    ],
                  ),
                  for(DataRow newWidget in newRow)
                    newWidget
                ],
              )
            ),
            FloatingActionButton(onPressed: (){
              setState(() {
                newRow.add(
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('170 kg')),
                      DataCell(Text('10')),
                      DataCell(
                        Checkbox(onChanged: (bool? value){}, value: true,)
                      ),
                    ],
                  )
                );
              });
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                content: Text("Exercicio Adicionado"),
                ));
            },
            child: Icon(Icons.add),
          ),
          ButtonWidget(buttonText: "FINALIZAR TREINO", width: 400, onpressed: (){
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            Navigator.pushNamed(context, "/treinos/historico");
          })]),
      )
      );
  }
}