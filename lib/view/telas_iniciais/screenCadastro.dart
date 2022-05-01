import 'package:flutter/material.dart';

import '../../controller/inputData.dart';
import '../../widgets/button.dart';

class ScreenCadastro extends StatelessWidget {
  const ScreenCadastro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              'assets/images/GymAppIcon.png',
              height: 155,
              width: 155,
            ),
            const Text("Gym App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            InputData()
                .loginInput("Seu nome de Usuário", "Nome de Usuário", false),
            InputData().loginInput("Senha", "Senha", true),
            InputData().loginInput("Confirmar Senha", "Confirmar Senha", true),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                      buttonText: 'CONFIRMAR CADASTRO',
                      width: 150,
                      onpressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
