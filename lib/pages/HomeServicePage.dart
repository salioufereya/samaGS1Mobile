import 'package:flutter/material.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

class HomeServicePage extends StatelessWidget {
  const HomeServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(imagePath: "images/ucad.png"),
          Container(
            color: Color(0xFF002C6c),
            height: 50,
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Icon(Icons.computer_outlined, color: Colors.white)),
                Text(
                  "LES SERVICES",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/add.png"),height: 150,),
                        SizedBox(height: 5),
                        Text("Ajouter un étudiant",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                      ],
                    ),
                  ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/consul.png"),height: 150,),
                        SizedBox(height: 5),
                        Text("Consulter mes données",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                      ],
                    ),
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/verif.png"),height: 150,),
                        SizedBox(height: 5),
                        Text("Vérifier un diplome",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                      ],
                    ),
                  ),),
                      Container(
                        alignment: Alignment.center,
                        color: Color(0xFF002C6c),
                        height: 35,
                        width: MediaQuery.of(context).size.width,
                        child: Text("BY GS1 SENEGAL",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                      )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}