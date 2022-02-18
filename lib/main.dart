import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_web/firebase_options.dart';
import 'package:whatsapp_web/rotas.dart';
import 'package:whatsapp_web/screens/login_screen.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xFF075E54),
  accentColor: Color(0xFF24D366),
);

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "Whatsapp Web teste",
    //home: LoginScreen(),
    theme: temaPadrao,
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRota,
    debugShowCheckedModeBanner: false,
  ));
}

