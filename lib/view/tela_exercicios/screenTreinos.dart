import 'package:flutter/material.dart';
import '../../widgets/appBarWidget.dart';
import '../../widgets/drawerWidget.dart';

class ScreenTreinos extends StatelessWidget{
  const ScreenTreinos({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(context),
      drawer: const MyDrawer(),
      body: Align(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                child: Text(
                  "TREINOS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}

