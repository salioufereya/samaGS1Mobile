import 'package:flutter/material.dart';
import 'package:sama_gs1/pages/ChoiceProfilPage.dart';
import 'package:sama_gs1/pages/LoginPage.dart';
import 'package:sama_gs1/pages/VerificationProductPage.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002C6c),
      body:
      Column(
        children: [
          logoAndHeader(imagePath: "images/GS1_Senegal.png"),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top:15),child:   InkWell(child:Image(image: AssetImage("images/verif.png"),height: 200),onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChoiceProfilPage()),
                );
              },)),
              Text("Vérification des diplomes", style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
           Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 0),child: InkWell(child: Image(image: AssetImage("images/choix2.png"),height: 200),onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerificationProductPage()),
                );
              },)),
              Text("Verification des produits", style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          ),
          ],
      ),
        bottomNavigationBar: Container(
          height: 35,
          alignment: Alignment.center,
          color:  Colors.white,
          child: Text("BY GS1 SENEGAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFFF26334))),
        )
    );
  }
}
