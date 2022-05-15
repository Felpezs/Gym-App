import 'package:flutter/material.dart';

class exercicioInput extends StatelessWidget{

  @override   
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          obscureText: false,
          decoration: const InputDecoration(hintText: "Nome que deseja dar ao exercício", labelText: "Nome do exercício"),
          onSaved: (String? value) {},
          validator: (String? value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Escreva algo";
              } else {
                return null;
              }
            } else {
              return "Algo errado ocorreu";
            }
          },
        ),
      ),
    );
  }
}