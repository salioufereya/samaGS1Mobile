import 'package:flutter/material.dart';




logoAndHeader({String? samaText, required String imagePath}) {
  return Container(
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(200),
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
  );
}




Widget titre({required String titre}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Text(
      '$titre',
      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
    ),
  );
}
