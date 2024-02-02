import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/sections/CustomBottomNavigationBar.dart';
import 'package:sama_gs1/pages/sections/CustomTextField.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

import '../providers/Auth.dart';
import '../utils/validate.dart';


class GestionProfilEcole extends StatefulWidget {
  const GestionProfilEcole({super.key});
  
  @override
  State<GestionProfilEcole> createState() => _GestionProfilEcoleState();
}

class _GestionProfilEcoleState extends State<GestionProfilEcole> {
  TextEditingController _nom = TextEditingController();
  TextEditingController _adresse = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _telephone_bureau = TextEditingController();
  TextEditingController _telephone = TextEditingController();
  TextEditingController _matricule = TextEditingController();
  TextEditingController _numero_gtin = TextEditingController();
  TextEditingController _date = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _nom.dispose();
    _adresse.dispose();
    _email.dispose();
    _telephone_bureau.dispose();
    _telephone.dispose();
    _matricule.dispose();
    _numero_gtin.dispose();
    _date.dispose();
  }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    double largeur = MediaQuery.of(context).size.width * 0.44;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
          header(imagePath:(auth.user!.ecole!.logo!),context: context),
           SectionTitre(
             backgroundColor: Color(0xFF002C6c),
             title: "GESTION DU PROFIL DE L'ECOLE",
             icon: Icons.settings,
           ),
           Padding(
             padding: EdgeInsets.all(10),
             child: Container(
               height: 205,
               width: largeur ,
               color: Color(0xFF002C6c),
               child: Column(children: [
                 Padding(
                   padding: EdgeInsets.only(bottom: 15),
                   child: Column(
                     children: [
                       Text("Logo de l'école",style: TextStyle(color: Colors.white)),
                       Image(
                           image: AssetImage("images/verif.png"), height: 120),
                     ],
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     ElevatedButton(onPressed: () {}, child: Text("Edit")),
                     ElevatedButton(
                         onPressed: () {}, child: Text("Delete")),
                   ],
                 ),
               ]),
             ),
           ),
           CustomTextField(
             labelText: 'Nom de l\'école',
             controller: _nom,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "Le nom  est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer un nom valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'Adresse',
             controller: _adresse,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "L'adresse  est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer une adresse valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'email',
             controller: _email,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "L'email est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer une adresse email valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'Téléphone Bureau',
             controller: _telephone_bureau,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "Le téléphone bureau est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer un numero  valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'Téléphone personnel',
             controller: _telephone,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "Le téléphone personnel est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer un numero  valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'Date de création',
             controller: _date,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "La date  est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer une date valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
           ),
           CustomTextField(
             labelText: 'Numéro d\'autorisation',
             controller: _date,
             isObscure: false,
             onChanged: (value) {
               setState(() {
                 isEmailValid = validateEmailAdress(value);
               });
             },
             validator: (value) {
               if (value!.isEmpty) {
                 return "La date  est obligatoire";
               } else if (!isEmailValid) {
                 return "Entrer une date valide";
               }
               return "";
             },
             isEmailValid: isEmailValid,
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
               child: const Text('Modifier',
                   style: TextStyle(color: Colors.white)),
               onPressed: () {
                 Map creds = {
                 };
               },
             ),
           ),
         ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 35,
        alignment: Alignment.center,
        color:  Color(0xFF002C6c),
        child: Text("BY GS1 SENEGAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
      )
    );
  }
}
