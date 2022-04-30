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
    );
  }
}

