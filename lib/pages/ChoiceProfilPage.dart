import 'package:flutter/material.dart';
import 'package:sama_gs1/pages/LoginPage.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

class ChoiceProfilPage extends StatelessWidget {
  const ChoiceProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002C6c),
 body:
 Column(
   children: [
     logoAndHeader(imagePath: "images/GS1_Senegal.png"),
titre(titre: "Veillez choisir votre profil"),
      Column(
       children: [
        Padding(padding: EdgeInsets.only(top: 0),child:   InkWell(child:Image(image: AssetImage("images/choix1.png"),height: 200),onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogiPage()),
          );
        },)),
         Text("Une école de formation", style: TextStyle(color: Colors.white, fontSize: 18))
       ],
     ),
     const Column(
       children: [
         Padding(padding: EdgeInsets.only(top: 0),child: Image(image: AssetImage("images/choix2.png"),height: 200)),
         Text("Une agence intérim", style: TextStyle(color: Colors.white, fontSize: 18))
       ],
     ),
     const Padding(padding: EdgeInsets.only(top: 15)),
     Expanded(child:
     Container(
       alignment: Alignment.center,
       color: Colors.white,
       child: const Text("BY GS1 SENEGAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xFFF26334))),
     )
     )],
 ),
 );
  }
}
