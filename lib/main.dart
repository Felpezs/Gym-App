import 'package:flutter/material.dart';
import 'view/telas_iniciais/screenCadastro.dart';
import 'view/telas_iniciais/screenUserInfo.dart';

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
      home: const ScreenLogin(),
    );
  }
}

class ScreenLogin extends StatelessWidget{
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/GymAppIcon.png',
              height: 100,
              width: 100,
            ),
            const Text(
              "GymApp",
              style: TextStyle(
                fontSize: 17,
              )
            ),
          ]
        ),
      ),
    );
  }
}

/*
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Entrar'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenUserInfo()));
              },
            ),
            ElevatedButton(
              child: const Text('Cadastrar'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenCadastro()));
              },
            )
          ],
        ),
      ),
    );
  }
}
*/
/*
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
*/