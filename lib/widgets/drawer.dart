import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_event.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_state.dart';
import 'package:prog_mobile/server/firestoreServer.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xff6c92f4), Color(0xff1a73e9)],
              ),
            ),
            child: Text('Gym App',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.sports_gymnastics),
            title: const Text('Treinos'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Exercicios Registrados'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/treinos'));
              Navigator.pushNamed(context, "/treinos/exercicios_registrados");
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historico'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/treinos'));
              Navigator.pushNamed(context, "/treinos/historico");
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box_rounded),
            title: const Text('Editar Perfil'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/treinos'));
              Navigator.pushNamed(context, "/treinos/perfil");
            },
          ),
        ],
      ),
    );
  }
}