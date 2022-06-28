import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_gym_info/gym_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_gym_info/gym_info_state.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_event.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_state.dart';
import 'package:prog_mobile/widgets/buttons/floatingButton.dart';
import '../../../widgets/appBar.dart';
import '../../../widgets/drawer.dart';
import '../../../widgets/cardTreino.dart';
import '../../bloc/bloc_gym_info/gym_info_event.dart';
import '../../model/treinos.dart';

class ScreenTreinos extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
    appBar: MyAppBar(context, title: "Treino"),
    drawer: MyDrawer(),
    body: Stack(
      children: [
        Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30,top: 70, bottom: 30),
                child: Text(
                  "TREINOS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: BlocBuilder<GymInfoBloc, GymInfoState>(
                builder: ((context,state) {
                  if(state is GymInfoLoaded){
                    return getTreinoListView(state.treinoCollection);
                  }
                  return const Text("Carregando...");
                }),
              ),
            ),
          ]
        ),
        FloatingButton(
          onpressed: () { 
            BlocProvider.of<GymInfoBloc>(context).add(InsertTreino(nomeTreino: 'Novo Treino'));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              content: Text("Treino Adicionado"),
              ));
          })
    ])
    );
  }
}

ListView getTreinoListView(TreinoCollection treinoCollection) {
    return ListView.builder(
        itemCount: treinoCollection.length(),
        itemBuilder: (context, position){
          String nomeTreino = treinoCollection.getTreinoAtIndex(position).nomeTreino;
          return CardWidget(nomeTreino: nomeTreino, route: "/treinos/exercicios_treino", props: nomeTreino, position: position);
        }
    );
  }