import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/button.dart';

import '../../controller/inputData.dart';
import '../../widgets/appBar.dart';
import '../../widgets/drawer.dart';

class ScreenCriarExercicio extends StatefulWidget {
  const ScreenCriarExercicio({Key? key}) : super(key: key);

  @override
  State<ScreenCriarExercicio> createState() => _ScreenCriarExercicioState();
}

class _ScreenCriarExercicioState extends State<ScreenCriarExercicio> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                width: 350,
                child: Column(
                  children: [
                    InputData().exercicioInput(
                        "Nome que deseja dar ao exercício",
                        "Nome do exercício",
                        false),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: Container(
                          padding: EdgeInsets.only(bottom: 10),
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonWidget(
                              buttonText: 'Registrar Exercício',
                              width: 50,
                              onpressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    //Adiciona exercicio novo
                                    context,
                                    "/treinos/exercicios_registrados");
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
