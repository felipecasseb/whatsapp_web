import 'package:flutter/material.dart';
import 'package:whatsapp_web/screens/home_mobile.dart';
import 'package:whatsapp_web/screens/home_web.dart';
import 'package:whatsapp_web/uteis/responsivo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsivo(
      mobile: HomeMobile(),
      web: HomeWeb(),
    );
  }
}
