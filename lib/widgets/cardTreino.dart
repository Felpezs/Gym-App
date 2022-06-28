import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_gym_info/gym_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_gym_info/gym_info_event.dart';

class CardWidget extends StatelessWidget{
  final String nomeTreino;
  final List<String>? exercicioRep;
  final String route;
  final int? position;
  final List<String>? melhorSeries;
  final String? props;
  
  CardWidget({
    this.props,
    this.melhorSeries, 
    this.position,
    required this.nomeTreino, 
    this.exercicioRep, 
    required this.route});

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  if(position!=null){
                    BlocProvider.of<GymInfoBloc>(context).add(SelectedTreino(position: position!));
                  }
                  Navigator.pushNamed(context, route, arguments: props);
                },
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(128, 128, 128, 100)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                            /*
                            for (String exercicio in exercicioRep!)
                              Text(
                                  exercicio,
                                  style: const TextStyle(fontSize: 14),
                                ),*/
                          ],
                        ),
                        if(melhorSeries != null)
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  "Melhor Série",
                                  style: TextStyle(
                                    color: Color.fromRGBO(53, 53, 53, 100),
                                    fontSize: 18
                                  ),
                                ),
                              ),
                              for (String melhorSerie in melhorSeries!) 
                                Text(
                                  melhorSerie,
                                  style: const TextStyle(fontSize: 14),
                                )
                            ],
                          )  
                      ],
                      ),
                  )
                  ),
                ),
    );
  }
}
