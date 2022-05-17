import 'package:flutter/material.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/inputs/userData.dart';

class ScreenLogin extends StatelessWidget{
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/GymAppIcon.png',
                height: 155,
                width: 155,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Gym App",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                ),
              ),
              const MyTextFormField(hintText: "seu email", labelText: "Email", icon: Icons.email),
              const MyTextFormField(hintText: "sua senha", labelText: "Senha", obscureText: true, icon: Icons.lock),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(buttonText: 'CADASTRAR', width: 150, onpressed: () {
                      Navigator.pushNamed(context, "/cadastro");
                    }),
                    ButtonWidget(buttonText: 'ENTRAR', width: 150, onpressed: () {
                      Navigator.pushReplacementNamed(context, "/userInfo");
                    })
                  ],
                ),
              )   
            ]
          ),
        ),
      ),
    );
  }
}