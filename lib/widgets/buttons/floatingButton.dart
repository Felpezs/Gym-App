import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget{
  final Function onpressed;

  FloatingButton({
    required this.onpressed,
  });

  @override 
  Widget build(BuildContext context){
    return Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                child: const Icon(Icons.add),
                onPressed: (){
                  onpressed();
                },
              ),
            ),
          );
  }
}