import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppBar(BuildContext context, {Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return AppBar(
    title: Text("Tem que implementar, ou nao"),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xff6c92f4), Color(0xff1a73e9)],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  //Referencia: https://stackoverflow.com/questions/52678469/the-appbardesign-cant-be-assigned-to-the-parameter-type-preferredsizewidget
}


