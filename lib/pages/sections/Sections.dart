import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama_gs1/pages/GestionProfileEcole.dart';

import '../../providers/Auth.dart';

logoAndHeader({String? samaText, required String imagePath}) {
  return Column(children: [
    Container(
      color: Colors.white,
      height: 40,
    ),
    Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(180),
          bottomRight: Radius.circular(180),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (samaText != null)
            Text(
              samaText,
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          Image(image: AssetImage(imagePath)),
        ],
      ),
    ),
  ]);

  Container(
    height: 180,
    color: Colors.white,
    width: double.infinity,
    /* decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(200),
      ),
    ),
    */
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (samaText != null)
          Text(
            samaText,
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        Image(image: AssetImage(imagePath)),
      ],
    ),
  );
}

Widget titre({required String titre}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Text(
      '$titre',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

base64ToImage(String base64String) {
  int index = base64String.indexOf(',');
  String base64Data = base64String.substring(index + 1);
  List<int> bytes = base64.decode(base64Data);
  return Image.memory(Uint8List.fromList(bytes));
}

Container header({required String imagePath, required BuildContext context}) {
  return Container(
    height: 100,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 80, // Définissez la largeur souhaitée
                    height: 70, // Définissez la hauteur souhaitée
                    child: base64ToImage(imagePath),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GestionProfilEcole()),
                    );
                  },
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log out",
                style: TextStyle(
                    color: Color(0xFF002C6c),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Warning'),
                          content: const Text(
                              'Voulez vraiment se déconnecter ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Annuler',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18)),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Provider.of<Auth>(context, listen: false)
                                      .logout(context: context),
                              child: const Text('Oui',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 32,
                    color: Color(0xFFF26334),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

Widget SectionTitre({
  required Color backgroundColor,
  required String title,
  required IconData icon,
}) {
  return Container(
    color: backgroundColor,
    height: 50,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Icon(icon, color: Colors.white),
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}



Container headerText({required BuildContext context}) {
  return Container(
    height: 100,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 80, // Définissez la largeur souhaitée
                    height: 70, // Définissez la hauteur souhaitée
                    child:Image(image: AssetImage("images/ucad.png")),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GestionProfilEcole()),
                    );
                  },
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log out",
                style: TextStyle(
                    color: Color(0xFF002C6c),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Warning'),
                      content: const Text(
                          'Voulez vraiment se déconnecter ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Annuler',
                              style: TextStyle(
                                  color: Colors.red, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () =>
                              Provider.of<Auth>(context, listen: false)
                                  .logout(context: context),
                          child: const Text('Oui',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 32,
                    color: Color(0xFFF26334),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
