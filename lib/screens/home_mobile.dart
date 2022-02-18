import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF075E54),
            title: Text("Whatsapp"),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search)
              ),
              SizedBox(width: 3,),
              IconButton(
                  onPressed: ()async{
                    await _auth.signOut();
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  icon: Icon(Icons.logout)
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              tabs: [
                Tab(text: "Conversas",),
            Tab(text: "Contatos",)
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Center(
                  child: Text("Conversas"),
                ),
                Center(
                  child: Text("Contatos"),
                )
              ],
            ),
          ),
        )
    );
  }
}
