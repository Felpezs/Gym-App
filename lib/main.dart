import 'package:flutter/material.dart';
import 'view/telas_gym/screenCriarExercicio.dart';
import 'view/telas_gym/screenListaExercicios.dart';
import 'view/telas_iniciais/screenCadastro.dart';
import 'view/telas_iniciais/screenUserInfo.dart';
import 'view/telas_iniciais/screenLogin.dart';
import 'view/telas_gym/treino/screenTreinos.dart';
import 'view/telas_gym/treino/screenExerciciosTreino.dart';
import 'view/telas_gym/treino/screenExecutarTreino.dart';
import 'view/telas_gym/historico/screenHistorico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/treinos',
      routes: {
        "/":(context)=> const ScreenLogin(),
        "/cadastro":(context)=> const ScreenCadastro(),
        "/userInfo":(context)=> const ScreenUserInfo(),
        "/treinos":(context)=> const ScreenTreinos(),
        "/treinos/exercicios_registrados":(context)=> const ScreenListaExercicios(),
        "/treinos/exercicios_registrados/criar_exercicio":(context)=> const ScreenCriarExercicio(),
        "/treinos/exercicios_treino":(context)=> const ScreenExerciciosTreino(),
        "/treinos/exercicios_treino/executar_treino":(context)=> const ScreenExecutarTreino(),
        //"/treinos/exercicios_treino/adicionar_exercicio":(context)=> const ScreenAdicionarExercicio(),
        "/treinos/historico":(context) => const ScreenHistorico(),
        //"/treinos/historico/historico_treino":(context) => const ScreenHistoricoTreino(),
        //"/treinos/perfil":(context) => const ScreenPerfil(),
        //"/treinos/sobre":(context) => const ScreenSobre()
      }
    );
  }
}