import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/AddStudent.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

import '../providers/Auth.dart';

class HomeServicePage extends StatefulWidget {
  const HomeServicePage({super.key});

  @override
  State<HomeServicePage> createState() => _HomeServicePageState();
}

class _HomeServicePageState extends State<HomeServicePage> {

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Column(
        children: [
          header(imagePath:(auth.user!.ecole!.logo!),context: context),
          SectionTitre(
            backgroundColor: Color(0xFF002C6c),
            title: "LES SERVICES",
            icon: Icons.computer_outlined,
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: InkWell(
                      child: Column(
                        children: [
                          Image(image: AssetImage("images/add.png"),height: 150,),
                          SizedBox(height: 5),
                          Text("Ajouter un étudiant",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF002C6c),fontSize: 17),)
                        ],
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddStudent()),
                        );
                      },
                    ),
                  ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/consul.png"),height: 150,),
                        SizedBox(height: 5),
                        Text("Consulter mes données",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF002C6c),fontSize: 17),)
                      ],
                    ),
                  ),),
                  const Padding(padding: EdgeInsets.only(top: 15),child: Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage("images/verif.png"),height: 150,),
                        SizedBox(height: 5),
                        Text("Vérifier un diplome",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF002C6c),fontSize: 17),)
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
