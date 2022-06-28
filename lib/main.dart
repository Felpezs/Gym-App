import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_exercise_info/exercise_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_bloc.dart';
import 'package:prog_mobile/view/treino/screen_selecionar_exercicio.dart';

import 'bloc/bloc_gym_info/gym_info_bloc.dart';
import 'bloc/manage_exercicioRegistrado/manage_bloc.dart';
import 'bloc/monitor_exercicioRegistrado/monitor_bloc.dart';
import 'view/exercicios/screen_criar_exercicio.dart';
import 'view/exercicios/screen_lista_exercicios.dart';
import 'view/historico/screen_historico.dart';
import 'view/historico/screen_historico_treino.dart';
import 'view/login/screen_cadastro.dart';
import 'view/login/screen_login.dart';
import 'view/login/screen_user_info.dart';
import 'view/screen_perfil.dart';
import 'view/treino/screen_executar_treino.dart';
import 'view/treino/screen_exercicios_treino.dart';
import 'view/treino/screen_treinos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuthenticationService().signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
          BlocProvider<UserInfoBloc>(create: (_) => UserInfoBloc()),
          BlocProvider<GymInfoBloc>(create: (_) => GymInfoBloc()),
          BlocProvider<ExerciseInfoBloc>(create: (_) => ExerciseInfoBloc()),
          BlocProvider<ManageBloc>(create: (context) => (ManageBloc())),
          BlocProvider<MonitorBloc>(create: (context) => (MonitorBloc()))
        ],
        child: MaterialApp(
            title: 'Gym App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            routes: {
              "/": (_) => ScreenLogin(),
              "/cadastro": (_) => ScreenCadastro(),
              "/cadastro/userInfo": (_) => const ScreenUserInfo(),
              "/treinos": (_) => ScreenTreinos(),
              "/treinos/exercicios_registrados": (_) =>
                  const ScreenListaExercicios(),
              "/treinos/exercicios_registrados/criar_exercicio": (_) =>
                  const ScreenCriarExercicio(),
              "/treinos/exercicios_treino": (_) => ScreenExerciciosTreino(),
              "/treinos/exercicios_treino/executar_treino": (_) =>
                  const ScreenExecutarTreino(),
              "/treinos/exercicios_treino/selecionar_exercicio": (_) =>
                  const ScreenSelecionarExercicio(),
              "/treinos/exercicios_treino/adicionar_exercicio": (_) =>
                  const ScreenCriarExercicio(),
              "/treinos/historico": (_) => const ScreenHistorico(),
              "/treinos/historico/historico_treino": (_) =>
                  const ScreenHistoricoTreino(),
              "/treinos/perfil": (_) => ScreenPerfil(),
            }));
  }
}
