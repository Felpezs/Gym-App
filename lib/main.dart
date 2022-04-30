import 'package:flutter/material.dart';
import 'view/telas_iniciais/screenCadastro.dart';
import 'view/telas_iniciais/screenUserInfo.dart';
import 'controller/inputData.dart';
import 'widgets/buttonWidget.dart';
void main() {
  runApp(const MyApp());
  ScreenLogin();
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
    }
    );
  }
}

class ScreenLogin extends StatelessWidget{
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/GymAppIcon.png',
                height: 155,
                width: 155,
              ),
              const Text(
                "Gym App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              InputData().loginInput("Seu nome de Usuário", "Nome de Usuário", false),
              InputData().loginInput("Senha", "Senha", true),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(buttonText: 'CADASTRAR', width: 150, onpressed: () {
                      Navigator.pushNamed(
                        context, "/cadastro");
                    }),
                    ButtonWidget(buttonText: 'ENTRAR', width: 150, onpressed: () {
                      Navigator.pushReplacementNamed(context, "/userInfo");
                    })
                  ],
                ),
              )
              
            ]
          ),
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
                        builder: (context) => const screenListaExercicios()));
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