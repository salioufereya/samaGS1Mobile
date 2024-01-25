import 'package:flutter/material.dart';
import 'package:sama_gs1/pages/HomeServicePage.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

class LogiPage extends StatelessWidget {
  const LogiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002C6c),
      body: SingleChildScrollView(
        child: Column(
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
                  height: 310,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text("Nom d'utilisateur",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17,color: Color(0xFF002C6c))),
                      ),
                       Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text("Mot de passe",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17,color: Color(0xFF002C6c))),
                      ),
                       Padding(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0)
                              )
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
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color(0xFFF26334),
                            textStyle: const TextStyle(fontSize: 20),
                            padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          child: const Text('Se connecter',style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeServicePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 25,right: 15,left: 5),child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Pas encore de compte ?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                  ElevatedButton(onPressed: (){}, child: Text("S'inscrire",style: TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(backgroundColor:Color(0xFFF26334)),)
                ],
              ),
            ),
            ),

           Container(
             alignment: Alignment.bottomCenter,
             height: 40,
             color: Colors.white,
             margin: const EdgeInsets.only(top: 40,bottom: 0),
             child: const Text("BY GS1 SENEGAL",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFFF26334))),
           )
          ],
        ),
      ),
    );
  }
}
