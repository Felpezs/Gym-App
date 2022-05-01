import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
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
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: const Icon(Icons.ice_skating),
          title: const Text('Treinos'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
          },
        ),
        ListTile(
          leading: const Icon(Icons.ice_skating),
          title: const Text('Exercicios Registrados'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            Navigator.pushNamed(context, "/treinos/exercicios_registrados");
          },
        ),
        ListTile(
          leading: const Icon(Icons.ice_skating),
          title: const Text('Historico'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            Navigator.pushNamed(context, "/treinos/historico");
          },
        ),
        ListTile(
          leading: const Icon(Icons.ice_skating),
          title: const Text('Editar Perfil'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            Navigator.pushNamed(context, "/treinos/perfil");
          },
        ),
        ListTile(
          leading: const Icon(Icons.ice_skating),
          title: const Text('Sobre'),
          onTap: () {
            Navigator.popUntil(context, ModalRoute.withName('/treinos'));
            Navigator.pushNamed(context, "/treinos/sobre");
          },
        ),
      ],
    ),
  );
  }
}