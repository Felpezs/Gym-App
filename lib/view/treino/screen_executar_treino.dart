import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_state.dart';
import 'package:prog_mobile/model/exercicios.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';
import 'package:prog_mobile/src/listaExercicios.dart';
import '../../bloc/bloc_exercise_info/exercise_info_event.dart';
import '../../widgets/buttons/button.dart';

class ScreenExecutarTreino extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    final nomeTreino = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                    child: Text(
                      "Treino - ${nomeTreino}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ButtonWidget(buttonText: "FINALIZAR TREINO", width: 400, onpressed: (){
                  Navigator.popUntil(context, ModalRoute.withName('/treinos'));
                  Navigator.pushNamed(context, "/treinos/historico");
                }),
            SizedBox(height:20),
            BlocBuilder<ExerciseInfoBloc, ExerciseInfoState>(builder: ((context, state) {
              if(state is ExercisesLoaded){
                return Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: getListViewDosExercicios(state.exercicioCollection)
                      ), 
                  ],
                );
              }
              return Text('Carregando');
            })),
            
           ]),
      )
      );
  }
  
}

class MyDataTable extends StatefulWidget{
  int exerciseIndex, serie=1;

  List<DataRow> myRows = [];
  MyDataTable(this.exerciseIndex, {Key? key}) : super(key: key);

  @override 
  State<MyDataTable> createState() => _MyDataTableState();
} 

class _MyDataTableState extends State<MyDataTable>{
  String rep = "";
  String carga = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          columnSpacing: 25, 
          columns: const[
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
          ],
          rows: widget.myRows,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
          child: FloatingActionButton(
            heroTag: widget.exerciseIndex,
            onPressed: (){
              setState(() {
                widget.myRows.add(
                  DataRow(
                    cells: <DataCell>[
                      DataCell(TextFormField(
                        initialValue: widget.serie.toString(),
                        readOnly: true,
                      )),
                      DataCell(TextFormField(
                        onChanged: (value) {
                          setState(() {
                            carga = value;
                            BlocProvider.of<ExerciseInfoBloc>(context).add(UpdateExecucao(
                              position: widget.exerciseIndex, 
                              carga:carga, 
                              repeticao: rep, 
                              serie: (widget.serie-1).toString())
                              );
                          });

                        },
                      )),
                      DataCell(TextFormField(
                        onChanged: (value) {
                          setState(() {
                            rep = value;
                            BlocProvider.of<ExerciseInfoBloc>(context).add(UpdateExecucao(
                              position: widget.exerciseIndex, 
                              carga: carga, 
                              repeticao: rep, 
                              serie: (widget.serie-1).toString())
                              );
                          });
                        },
                      )),
                    ],
                  )
                );
              });
          BlocProvider.of<ExerciseInfoBloc>(context).add(InsertExecucao(position: widget.exerciseIndex, carga:"", repeticao: "", serie: widget.serie.toString()));
          widget.serie += 1;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            content: Text("Exercicio Adicionado"),
            ));
        },
        child: Icon(Icons.add),
          ),
        )
      ],
      
    );
           
  }
}
ListView getListViewDosExercicios(ExercicioCollection exercicioCollection) {
  return ListView.builder(
      itemCount: exercicioCollection.length(),
      itemBuilder: (context, position) {
        return Column(
          children: [
            ListTile(
              leading: iconeExercicio(exercicio: exercicioCollection.getExercicioAtIndex(position)),
              title: Text(exercicioCollection.getExercicioAtIndex(position).nomeExercicio),
            ),
            const Divider(color: Colors.blue, thickness: 2,),
            MyDataTable(position)
              
          ],
        );
      }
  );
}

