import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/manage_exercicioRegistrado/manage_bloc.dart';
import 'package:prog_mobile/model/exercicioRegistrado.dart';
import 'package:prog_mobile/widgets/buttons/button.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/drawer.dart';
import '../../bloc/manage_exercicioRegistrado/manage_event.dart';
import '../../widgets/inputs/exerciseData.dart';

class ScreenCriarExercicio extends StatefulWidget {
  const ScreenCriarExercicio({Key? key}) : super(key: key);

  @override
  State<ScreenCriarExercicio> createState() => _ScreenCriarExercicioState();
}

class _ScreenCriarExercicioState extends State<ScreenCriarExercicio> {
  String? dropdownValue;
  final myController = TextEditingController();

  var valorTextoLocal;

  @override
  Widget build(BuildContext context) {
    void metodoCallBack(String valorTexto) {
      valorTexto = valorTexto;
      setState(() {
        valorTextoLocal = valorTexto;
      });
    }

    return Scaffold(
      appBar: MyAppBar(
        context,
        title: 'Adicionar Exercício',
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Text(
            "Preencha as informações do exercício",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            height: 20,
          ),
          Align(
            child: SingleChildScrollView(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    exercicioInput(metodoCallBack: metodoCallBack),
                    DropdownButton<String>(
                      itemHeight: 60,
                      isExpanded: true,
                      hint: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text("Músculo principal")),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Peito', 'Perna', 'Costas', 'Braço']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonWidget(
                              buttonText: 'Registrar Exercício',
                              width: 50,
                              onpressed: () {
                                registraExercicio(
                                    context, valorTextoLocal, dropdownValue);
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, "/treinos/exercicios_registrados");
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void registraExercicio(context, valorTextoLocal, dropdownValue) {
  ExercicioRegistrado exercicioRegistrado = ExercicioRegistrado.withData(
      nomeExercicio: valorTextoLocal, nomeCategoria: dropdownValue);

  BlocProvider.of<ManageBloc>(context)
      .add(SubmitEvent(exercicioRegistrado: exercicioRegistrado));
}
