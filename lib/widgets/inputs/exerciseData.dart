import 'package:flutter/material.dart';

class exercicioInput extends StatefulWidget {
  final Function metodoCallBack;
  const exercicioInput({Key? key, required this.metodoCallBack})
      : super(key: key);

  @override
  State<exercicioInput> createState() => _exercicioInputState();
}

class _exercicioInputState extends State<exercicioInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          obscureText: false,
          decoration: const InputDecoration(
              hintText: "Nome que deseja dar ao exercício",
              labelText: "Nome do exercício"),
          onSaved: (String? value) {},
          onChanged: (String? value) {
            widget.metodoCallBack(value);
          },
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
