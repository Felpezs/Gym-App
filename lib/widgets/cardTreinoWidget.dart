import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget{
  final String nomeTreino;
  final List<String> exercicioRep;
  
  CardWidget({
    required this.nomeTreino,
    required this.exercicioRep,
  });

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  Navigator.pushNamed(context, "/treinos/exercicios_treino");
                },
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(128, 128, 128, 100)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            nomeTreino,
                            style: const TextStyle(
                              color: Color.fromRGBO(53, 53, 53, 100),
                              fontSize: 18
                            ),
                          ),
                        ),
                        for (String exercicio in exercicioRep) 
                          Text(
                            exercicio,
                            style: const TextStyle(fontSize: 14),
                          ),
                      ],
                      ),
                  )
                  ),
                ),
    );
  }
}
