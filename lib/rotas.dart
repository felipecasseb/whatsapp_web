import 'package:flutter/material.dart';
import 'package:whatsapp_web/screens/home_screen.dart';
import 'package:whatsapp_web/screens/login_screen.dart';

class Rotas{
  static Route<dynamic> gerarRota(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case "/" :
        return MaterialPageRoute(
            builder: (_) => LoginScreen()
        );
      case "/login" :
        return MaterialPageRoute(
            builder: (_) => LoginScreen()
        );
      case "/home" :
        return MaterialPageRoute(
            builder: (_) => HomeScreen()
        );
    }
    return _erroRota();
  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
       body: Center(
         child: Text("Tela não encontrada!"),
       ),
      );
    });
  }
}