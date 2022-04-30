import 'package:flutter/material.dart';
import 'view/screenCadastro.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentScreen,
        children: [
          Center(
            child: TextButton(
              onPressed: (){
                setState(() {
              _currentScreen = 1;            
              });
            },
              child: Text('CADASTRAR')
            )),
          ScreenCadastro()
        ],
      ),
    );
  }
}
