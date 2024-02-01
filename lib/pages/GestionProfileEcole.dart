import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/sections/Sections.dart';

import '../providers/Auth.dart';


class GestionProfilEcole extends StatefulWidget {
  const GestionProfilEcole({super.key});

  @override
  State<GestionProfilEcole> createState() => _GestionProfilEcoleState();
}

class _GestionProfilEcoleState extends State<GestionProfilEcole> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Column(
       children: [
         header(imagePath:(auth.user!.ecole!.logo!),context: context),
         SectionTitre(
           backgroundColor: Color(0xFF002C6c),
           title: "GESTION DU PROFIL DE L'ECOLE",
           icon: Icons.settings,
         ),

       ],
      ),
    );
  }
}
