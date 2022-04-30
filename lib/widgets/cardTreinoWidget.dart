import 'package:flutter/material.dart';

class CardTreino extends StatelessWidget{
  const CardTreino({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return InkWell(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              onTap: () {
                Navigator.pushNamed(context, "/treinos/exercicios_treino");
              },
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(128, 128, 128, 100)),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "PERNAS",
                          style: TextStyle(
                            color: Color.fromRGBO(53, 53, 53, 100),
                            fontSize: 18
                          ),
                        ),
                      ),
                      Text(
                        "3 x Leg Press",
                        style: TextStyle(
                          fontSize: 14
                        )
                      ),
                      Text(
                        "3 x Cadeira Extensora",
                        style: TextStyle(
                          fontSize: 14
                        )
                      ),
                      Text(
                        "3 x Cadeira Flexora",
                        style: TextStyle(
                          fontSize: 14
                        ),
                      )
                    ],
                    ),
                )
                ),
              );
  }
}
