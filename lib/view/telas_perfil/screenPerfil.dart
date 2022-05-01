import 'package:flutter/material.dart';

import '../../controller/inputData.dart';
import '../../widgets/button.dart';

class ScreenPerfil extends StatefulWidget {
  const ScreenPerfil({Key? key}) : super(key: key);

  @override
  State<ScreenPerfil> createState() => _ScreenPerfilState();
}

class _ScreenPerfilState extends State<ScreenPerfil> {
  String? genero;
  double _currentSliderValueAltura = 20;
  double _currentSliderValuePeso = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Nos Conte Sobre Você :)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Atualize ou corrija alguma informação sua:",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              child: Align(
                child: SingleChildScrollView(
                  child: Column(children: [
                    InputData().loginInput(
                        "Seu nome de Usuário", "Nome de Usuário", false),
                    InputData().loginInput("Senha", "Senha", true),
                    InputData()
                        .loginInput("Confirmar Senha", "Confirmar Senha", true),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Altura",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _currentSliderValueAltura,
              max: 220,
              divisions: 200,
              label: (_currentSliderValueAltura.round().toString() + "cm"),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValueAltura = value;
                });
              },
            ),
            Text(
              "Peso",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _currentSliderValuePeso,
              max: 220,
              divisions: 200,
              label: (_currentSliderValuePeso.round().toString() + "kg"),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValuePeso = value;
                });
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    child: ListTile(
                      title: Text("Masculino"),
                      leading: Radio(
                          value: "Masculino",
                          groupValue: genero,
                          onChanged: (value) {
                            setState(() {
                              genero = value.toString();
                            });
                          }),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: ListTile(
                      title: Text("Feminino"),
                      leading: Radio(
                          value: "Feminino",
                          groupValue: genero,
                          onChanged: (value) {
                            setState(() {
                              genero = value.toString();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                  buttonText: "Confirmar",
                  width: 100,
                  onpressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/treinos");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
