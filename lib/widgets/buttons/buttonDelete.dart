import 'package:flutter/material.dart';

class ButtonDelete extends StatelessWidget {
  Function? onPressed;
  String? onPressedMessage;

  ButtonDelete({this.onPressed, this.onPressedMessage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        if(onPressed != null){
          onPressed!();
          if(onPressedMessage != null){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              content: Text(onPressedMessage!), 
              backgroundColor: Colors.red, 
              duration: Duration(seconds: 1),
            ));
          }
          
        }
      }, 
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
