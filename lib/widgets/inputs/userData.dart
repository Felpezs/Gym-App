import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget{

  final String hintText;
  final String labelText;
  final bool? obscureText;
  final String? initialValue;
  final IconData icon;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChanged;

  const MyTextFormField({
    Key? key,
    required this.hintText, 
    required this.labelText, 
    required this.icon,
    this.initialValue,
    this.obscureText, 
    this.validator, 
    this.onSaved,
    this.onChanged
  }): super(key: key);

  @override
  Widget build(BuildContext context){
     return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue,
          validator: validator,
          obscureText: obscureText == null ? false : true,
          decoration: InputDecoration(
            hintText: "Digite $hintText ...", 
            labelText: labelText,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
          ),
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ),
    );
  }
}