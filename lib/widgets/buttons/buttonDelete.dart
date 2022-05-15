import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, //Deletar exercicio do treino 
      child: Icon(Icons.remove, color: Colors.white),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(5),
        primary: Color.fromRGBO(233, 26, 26, 100),
        onPrimary: Color.fromRGBO(244, 108, 108, 100),
      ),
    );        
  }
}
