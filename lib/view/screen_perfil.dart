import 'package:flutter/material.dart';

import '../widgets/inputs/userData.dart';
import '../widgets/buttons/button.dart';

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
            SizedBox(
              width: 500,
              child: Column(
                children: const [
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
            Align(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      MyTextFormField(hintText: "seu nome de usuário", labelText: "Nome de Usuário", obscureText: false, icon: Icons.person),
                      MyTextFormField(hintText: "sua senha", labelText: "Senha", obscureText: true, icon: Icons.lock),
                      MyTextFormField(hintText: "sua senha", labelText: "Confirmar Senha", obscureText: true, icon: Icons.lock),
                  ]),
                ),
            ),
            const SizedBox(height: 30),
            const Text(
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
            const Text(
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      title: const Text("Masculino"),
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
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      title: const Text("Feminino"),
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
