import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/sections/CustomTextField.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

import '../providers/Auth.dart';
import '../utils/validate.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController _nom = TextEditingController();
  TextEditingController _prenom = TextEditingController();
  TextEditingController _filiere = TextEditingController();
  TextEditingController _departement = TextEditingController();
  TextEditingController _niveau = TextEditingController();
  TextEditingController _matricule = TextEditingController();
  TextEditingController _numero_gtin = TextEditingController();
  TextEditingController _date = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nom.dispose();
    _prenom.dispose();
    _filiere.dispose();
    _departement.dispose();
    _niveau.dispose();
    _matricule.dispose();
    _numero_gtin.dispose();
    _date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    double largeur = MediaQuery.of(context).size.width * 0.44;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            header(imagePath: (auth.user!.ecole!.logo!), context: context),
            SectionTitre(
              backgroundColor: Color(0xFF002C6c),
              title: "AJOUT D'ETUDIANT",
              icon: Icons.add_box,
            ),
            Row(
              children: [
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
                            Text("Photo De l'étudiant",style: TextStyle(color: Colors.white)),
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 205,
                    width: largeur ,
                    color:  Color(0xFF002C6c),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Column(
                          children: [
                            Text("Photo Du diplome",style: TextStyle(color: Colors.white)),
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
              ],
            ),
            CustomTextField(
              labelText: 'Nom',
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
              labelText: 'Prénom',
              controller: _prenom,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Le prénom  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer un prenom valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Filiére',
              controller: _filiere,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "La filiere  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer une filiere valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Département',
              controller: _departement,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Le departement  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer un departement valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Niveau',
              controller: _niveau,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Le niveau  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer un niveau valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Matricule',
              controller: _matricule,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "La matricule  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer un matricule valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Numero GTIN',
              controller: _numero_gtin,
              isObscure: false,
              onChanged: (value) {
                setState(() {
                  isEmailValid = validateEmailAdress(value);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Le numero_gtin  est obligatoire";
                } else if (!isEmailValid) {
                  return "Entrer un numero_gtin valide";
                }
                return "";
              },
              isEmailValid: isEmailValid,
            ),
            CustomTextField(
              labelText: 'Date D\'OBTENTIOn',
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF26334),
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text('Ajouter',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Map creds = {};
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
