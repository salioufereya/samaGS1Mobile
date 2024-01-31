import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
class VerificationProductPage extends StatefulWidget {
  const VerificationProductPage({super.key});
  @override
  State<VerificationProductPage> createState() => _VerificationProductPageState();
}

class _VerificationProductPageState extends State<VerificationProductPage> {
  String valeur="";

  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002C6c),
      appBar: AppBar(
        title: Text("Scan Barcode",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: scanBarcodeNormal,
                child:  const Column(
                  children: [
                    Icon(Icons.camera_alt_rounded),
                    Text("Scanner le code à barre"),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: TextField(
                controller: _controller,
                onChanged: (value){
                  valeur = value;
                },
                obscureText: false,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Saisir le code à barre",
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0)
                    )
                ),
              ),
            ),
            Text("Resultat code bar :${valeur}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:const Color(0xFFF26334),
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                child: const Text('Vérifier',style: TextStyle(color: Colors.white)),
                onPressed: ()  {
                 String url = 'https://www.gs1.org/services/verified-by-gs1/results?gtin=${_controller.text}';
                 print(_controller.text);
                  _launchURL(url);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
      setState(() {
        // Update the state variable with the scanned barcode
        _controller.text = barcodeScanRes;
        valeur = barcodeScanRes;
      });
    } on PlatformException {
      setState(() {
        // Handle the platform exception, if needed
        valeur = "Failed to get platform version";
      });
    }
  }
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Cannot launch URL";
    }
  }


}
