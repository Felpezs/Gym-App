import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputData{
  Widget loginInput(String hintText, String labelText, bool obscureText){
    return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: hintText,
                    labelText: labelText
                    ),
                  onSaved: (String? value){},
                  validator: (String? value){
                    if(value != null ){
                      if(value.isEmpty){
                        return "Escreva algo";
                      }
                      else{
                        return null;
                      }
                    }
                    else{
                      return "Algo errado ocorreu";
                    }
                  },
                ),
              ),
            );
  }
}