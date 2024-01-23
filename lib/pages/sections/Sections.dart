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


Container header({required String imagePath}){
  return   Container(
    height: 105,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Padding(
            padding: EdgeInsets.only(top: 25, left: 25),
            child: Column(
              children: [
                Image(image: AssetImage(imagePath)),
                Text(
                  "UCAD",
                  style: TextStyle(
                      color: Color(0xFFF26334),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            )),
        Padding(padding: const EdgeInsets.only(right: 10,top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Log out",style: TextStyle(color: Color(0xFF002C6c),fontSize: 20,fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.logout_outlined,size: 32,color: Color(0xFFF26334),))
            ],
          ),)
      ],
    ),
  );
}