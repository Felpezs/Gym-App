import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBar.dart';
import 'package:prog_mobile/widgets/drawer.dart';

class ScreenSelecionarExercicio extends StatelessWidget{
  const ScreenSelecionarExercicio({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: "Treino"),
      drawer: MyDrawer(),

    );
  }

}