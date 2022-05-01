import 'package:flutter/material.dart';
import '../../widgets/button.dart';

class ScreenUserInfo extends StatelessWidget{
  const ScreenUserInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            Text(
              "Nos Conte Sobre Você :)",
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Para te dar uma melhor experiência, precisamos das seguintes informações",
              textAlign: TextAlign.center,
            ),
          ButtonWidget(
            buttonText: "Continuar", 
            width: 100, 
            onpressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/treinos");
          })
          ]
        ),
      )
    );
  }
}