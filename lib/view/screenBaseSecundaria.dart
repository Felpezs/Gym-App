import 'package:flutter/material.dart';
import 'package:prog_mobile/view/screenAdicionarExercicio.dart';
import 'package:prog_mobile/view/screenComponentes.dart';

class screenBaseSecundaria extends StatelessWidget {
  const screenBaseSecundaria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context), //Falta implementar o título do header
      drawer: myDrawer(context),
      body: screenAdicionarExercicio(), //Primeira tela da segunda main
    );
  }
}
