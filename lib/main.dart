import 'package:flutter/material.dart';
import 'package:prog_mobile/view/tela_exercicios/screenAdicionarExercicio.dart';
import 'view/tela_exercicios/screenListaExercicios.dart';
import 'view/telas_iniciais/screenCadastro.dart';
import 'view/telas_iniciais/screenUserInfo.dart';
import 'view/telas_iniciais/screenLogin.dart';
import 'view/tela_exercicios/screenTreinos.dart';
import 'controller/inputData.dart';
import 'widgets/buttonWidget.dart';
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
      initialRoute: '/',
      routes: {
        "/":(context)=> const ScreenLogin(),
        "/cadastro":(context)=> const ScreenCadastro(),
        "/userInfo":(context)=> const ScreenUserInfo(),
        "/treinos":(context)=> const ScreenTreinos(),
        "/treinos/exercicios_registrados":(context)=> const ScreenListaExercicios(),
        "/treinos/exercicios_registrados/criar_exercicio":(context)=> const ScreenCriarExercicio(),
        //"/treinos/exercicios_treino":(context)=> const ScreenExerciciosTreino(),
        //"/treinos/exercicios_treino/executar_treino":(context)=> const ScreenExecutarTreino(),
        //"/treinos/exercicios_treino/adicionar_exercicio":(context)=> const ScreenAdicionarExercicio(),
        //"/treinos/historico":(context) => const ScreenHistorico(),
        //"/treinos/historico/historico_treino":(context) => const ScreenHistoricoTreino(),
      }
    );
  }
}