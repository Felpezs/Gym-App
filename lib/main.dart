import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/screen_perfil.dart';
import 'view/historico/screen_historico.dart';
import 'view/historico/screen_historico_treino.dart';
import 'view/exercicios/screen_criar_exercicio.dart';
import 'view/exercicios/screen_lista_exercicios.dart';
import 'view/treino/screen_executar_treino.dart';
import 'view/treino/screen_exercicios_treino.dart';
import 'view/treino/screen_treinos.dart';
import 'view/login/screen_cadastro.dart';
import 'view/login/screen_login.dart';
import 'view/login/screen_user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          "/": (_) => ScreenLogin(),
          "/cadastro": (_) => const ScreenCadastro(),
          "/userInfo": (_) => const ScreenUserInfo(),
          "/treinos": (_) => const ScreenTreinos(),
          "/treinos/exercicios_registrados": (_) => const ScreenListaExercicios(),
          "/treinos/exercicios_registrados/criar_exercicio": (_) => const ScreenCriarExercicio(),
          "/treinos/exercicios_treino": (_) => const ScreenExerciciosTreino(),
          "/treinos/exercicios_treino/executar_treino": (_) => const ScreenExecutarTreino(),
          "/treinos/exercicios_treino/adicionar_exercicio": (_) => const ScreenCriarExercicio(),
          "/treinos/historico": (_) => const ScreenHistorico(),
          "/treinos/historico/historico_treino": (_) => const ScreenHistoricoTreino(),
          "/treinos/perfil": (_) => const ScreenPerfil(),
        });
  }
}
