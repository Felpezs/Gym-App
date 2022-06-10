import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_event.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_state.dart';

import '../../widgets/buttons/button.dart';

class ScreenUserInfo extends StatelessWidget{
  const ScreenUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoBloc(),
      child: UserInfoView()
    );
  }
}

class UserInfoView extends StatefulWidget{
  UserInfoView({Key? key}) : super(key: key);

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView>{
  String? genero;
  double _currentSliderValueAltura = 20;
  double _currentSliderValuePeso = 20;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoBloc, UserInfoState>(
      listener: ((context, state) => {
        if(state is Inserted){
          Navigator.pushReplacementNamed(context, "/treinos")
        }
        else if(state is NotInserted){}
        else if(state is InfoError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), 
              backgroundColor: Colors.red, 
              duration: const Duration(seconds: 1)
              )
          )
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Um erro ocorreu :('), 
              backgroundColor: Colors.red, 
              duration: Duration(seconds: 1),
            ))
        }
      }),
      child: Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Column(
                children:const  [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Nos Conte Sobre Você :)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Para te dar uma melhor experiência, precisamos das seguintes informações",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      title: const Text("Masculino"),
                      leading: Radio(
                          value: "Masculino",
                          groupValue: genero,
                          onChanged: (value) {
                              setState(() {
                                genero = value.toString();
                              });
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: ListTile(
                      title: const Text("Feminino"),
                      leading: Radio(
                          value: "Feminino",
                          groupValue: genero,
                          onChanged: (value) {
                            setState(() {
                              genero = value.toString();
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Altura",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _currentSliderValueAltura,
              max: 220,
              divisions: 200,
              label: (_currentSliderValueAltura.round().toString() + "cm"),
              onChanged: (double value) {
                  setState(() {
                  _currentSliderValueAltura = value;
                });
              },
            ),
            const Text(
              "Peso",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _currentSliderValuePeso,
              max: 220,
              divisions: 200,
              label: (_currentSliderValuePeso.round().toString() + "kg"),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValuePeso = value;
                });
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                  buttonText: "Continuar",
                  width: 100,
                  onpressed: () {
                    BlocProvider.of<UserInfoBloc>(context).add(
                      InsertInfo(
                        username: "Geraldo", 
                        genero: genero!, 
                        altura: _currentSliderValueAltura, 
                        peso: _currentSliderValuePeso
                      ));
                  }),
            )
          ],
        ),
      ),
    ),
    );
  }
}