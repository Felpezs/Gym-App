import 'package:flutter/material.dart';

import '../../widgets/buttons/button.dart';

class ScreenUserInfo extends StatefulWidget {
  const ScreenUserInfo({Key? key}) : super(key: key);

  @override
  State<ScreenUserInfo> createState() => _ScreenUserInfoState();
}

class _ScreenUserInfoState extends State<ScreenUserInfo> {
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
              width: 300,
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
                    "Para te dar uma melhor experiência, precisamos das seguintes informações",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
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
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                  buttonText: "Continuar",
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
