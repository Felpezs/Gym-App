import 'package:flutter/material.dart';
import 'package:prog_mobile/widgets/appBarWidget.dart';
import 'package:prog_mobile/widgets/drawerWidget.dart';

class ScreenExerciciosTreino extends StatelessWidget{
  const ScreenExerciciosTreino({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: MyDrawer(),
      body: Align(
        child: Column(
          children: [
            Text("A")
          ]
        )
      ),
    );
  }
}