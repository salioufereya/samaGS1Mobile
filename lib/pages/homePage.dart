import 'package:flutter/material.dart';
import 'package:sama_gs1/pages/ChoiceProfilPage.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

import 'ChoicePage.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF002C6c),
      body:Column(
          mainAxisSize: MainAxisSize.max,
        children: [
          logoAndHeader(samaText: "SAMA",   imagePath: "images/logoGs1.png"),
          titre(titre: "Vérifier et valider en toute sécurité"),
          Expanded(child: Stack(
            alignment: Alignment.center,
            children: [
              const Image(image: AssetImage("images/aman.png")),
              Positioned(
                bottom: 100,
                child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor:Color(0xFFF26334),
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text('DEMARRER',style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChoicePage()),
                  );
                },
              ),),
              Positioned(child:
              Container(
                child: Text("BY GS1 SENEGAL", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF002C6c))),
                height: 100,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100)
                    // Vous pouvez également définir bottomRight si nécessaire
                  ),
                ),
              ),
                bottom: -40,
              )
            ],
          ))
        ],
        ),
    );
  }
}

