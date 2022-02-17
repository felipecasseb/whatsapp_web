import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  bool _cadastroUsuario = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  _cadastrarUsuario() async{
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if(email.isNotEmpty && email.contains('@')){
      if(senha.isNotEmpty && senha.length >=6){

        //cadastro
        if(_cadastroUsuario){
          if(nome.isNotEmpty && nome.length>=2){
            await _auth.createUserWithEmailAndPassword(
                email: email,
                password: senha
            ).then((auth){

              //upload da foto
              String? idUsuario = auth.user?.uid;
              print("Usuario cadastrado: $idUsuario");
            });
          }else{
            print("Nome inválido");
          }
        }

        //login
         else{

        }
      }else{
        print("Senha inválida");
      }
    }else{
      print("Email Inválido");
    }
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color(0XFFD9DBD5),
        width: largura,
        height: altura,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: largura,
                height: altura * 0.5,
                color: Color(0xFF075E54),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    padding: EdgeInsets.all(40),
                    width: 500,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: _cadastroUsuario,
                          child: ClipOval(
                              child: Image.asset(
                            "images/perfil.png",
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: _cadastroUsuario,
                          child: OutlinedButton(
                              onPressed: () {}, child: Text("Selecionar foto")),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: _cadastroUsuario,
                          child: TextField(
                            controller: _controllerNome,
                            decoration: InputDecoration(
                                hintText: "Nome",
                                labelText: "Nome",
                                suffixIcon: Icon(Icons.person_outline)),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              suffixIcon: Icon(Icons.email_outlined)),
                        ),
                        TextField(
                          obscureText: true,
                          controller: _controllerSenha,
                          decoration: InputDecoration(
                              hintText: "Senha",
                              labelText: "Senha",
                              suffixIcon: Icon(Icons.lock_outline)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                _cadastrarUsuario();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF075E54)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  _cadastroUsuario ? "Cadastrar" : "Entrar",
                                  style: TextStyle(fontSize: 18),
                                ),
                              )),
                        ),
                        Row(
                          children: [
                            Text("Login"),
                            Switch(
                                value: _cadastroUsuario,
                                onChanged: (bool valor) {
                                  setState(() {
                                    _cadastroUsuario = valor;
                                  });
                                }),
                            Text("Cadastro"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
