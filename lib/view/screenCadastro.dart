import 'package:flutter/material.dart';

class ScreenCadastro extends StatelessWidget {
  const ScreenCadastro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return presentationScreen();
  }
}

Widget presentationScreen() {
  return Scaffold(
    body: Column(children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(150),
            border: Border.all(color: Colors.black, width: 3)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
              "https://avatars.githubusercontent.com/u/38634459?v=4",
              width: 200,
              height: 200,
              fit: BoxFit.cover),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Text("Felipe Eduardo",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent)),
      ),
      const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Sou o Felipe Eduardo. Tenho 20 anos e no meu tempo livre gosto de jogar alguns jogos com amigos. Tenho preferência para programação para web, porém consigo desenvolver em outras plataformas. No momento, estou aprendendo a desenvolver para dispositivos móveis com flutter!",
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ))
    ]),
  );
}
