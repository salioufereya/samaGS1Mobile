import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/HomeServicePage.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';
import 'package:sama_gs1/utils/validate.dart';
import '../providers/Auth.dart';

class LogiPage extends StatefulWidget {
  const LogiPage({super.key});

  @override
  State<LogiPage> createState() => _LogiPageState();
}

class _LogiPageState extends State<LogiPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid=false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth authProvider = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF002C6c),
      body: SingleChildScrollView(
          child: Consumer<Auth>(builder: (context, auth, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoAndHeader(imagePath: "images/GS1_Senegal.png"),
            const Padding(
              padding: EdgeInsets.only(top: 45, left: 60, right: 10, bottom: 5),
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Center(
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text("Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color(0xFF002C6c))),
                        ),
                            Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: TextFormField(
                                        obscureText: false,
                                        onChanged: (value) {
                                              setState(() {
                                                    isEmailValid = validateEmailAdress(value);
                                              });
                                        },
                                        controller: _emailController,
                                        validator: (value) {
                                              if (value!.isEmpty) {
                                                    return "L'adresse mail est obligatoire";
                                              } else if (!isEmailValid) {
                                                    return "Entrer un email valide";
                                              }
                                              return null; // Retourne null s'il n'y a pas d'erreur de validation
                                        },
                                        decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                              enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0),
                                                    borderSide: BorderSide(color: Colors.black87),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0),
                                                    borderSide: BorderSide(color: isEmailValid ? Colors.green : Colors.red),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0),
                                                    borderSide: BorderSide(color: Colors.red),
                                              ),
                                              focusedErrorBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0),
                                                    borderSide: BorderSide(color: Colors.red),
                                              ),
                                        ),
                                  ),
                            ),
                            const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text("Mot de passe",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color(0xFF002C6c))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                isPasswordValid = validatePassword(value);
                              });
                            },
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Le mot de passe est obligatoire";
                              } else if (!validatePassword(value)) {
                                return "Minimum 5 caractères dont un caractère spécial";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(color: isPasswordValid ? Colors.green : Colors.red),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 15),
                          child: Text("Mot de passe oublié ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF26334),
                              textStyle: const TextStyle(fontSize: 20),
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 15),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            child: const Text('Se connecter',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Map creds = {
                                'email': _emailController.text,
                                'password': _passwordController.text
                              };
                              if (_formkey.currentState!.validate()) {
                                authProvider.login(
                                    creds: creds, context: context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, right: 15, left: 5),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Pas encore de compte ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("S'inscrire",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF26334)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 40,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 40, bottom: 0),
              child: const Text("BY GS1 SENEGAL",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF26334))),
            )
          ],
        );
      })),
    );
  }
}
