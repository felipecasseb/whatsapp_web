import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_web/firebase_options.dart';
import 'package:whatsapp_web/rotas.dart';
import 'package:whatsapp_web/screens/login_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "Whatsapp Web teste",
    //home: LoginScreen(),
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRota,
    debugShowCheckedModeBanner: false,
  ));
}

