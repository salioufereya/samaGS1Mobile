import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sama_gs1/models/Data.dart';
import 'package:sama_gs1/pages/LoginPage.dart';
import 'package:sama_gs1/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../pages/HomeServicePage.dart';
class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
User? _user;
String? _token;
  User? get user => _user;
  final storage=new FlutterSecureStorage();
  bool get authenticated => _isLoggedIn;
  void login({required Map creds, required BuildContext context}) async {
    try {
      Dio.Response response = await dio().post('/users/login', data: creds);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        String errorMessage = responseData['message'] ?? 'Unknown error';
        if (responseData['code'] == 200) {
          _isLoggedIn = true;
          this._user = User.fromJson(responseData['data']['user']);
          this._token =responseData['data']['token'] as String?;
          this.storeToken(token:_token as String);
          this.storeUser(user:responseData['data']['user']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeServicePage()),
          );
        } else {
          Flushbar(
            title: 'Bad credentials',
            message: errorMessage,
            duration: Duration(seconds: 5),
          ).show(context);
          _isLoggedIn = false;
        }
      }
    } catch (e) {
      print("Oops, something went wrong: $e");
    } finally {
      notifyListeners();
    }
  }


  void logout({required BuildContext context}) {
    _isLoggedIn = false;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogiPage()),
    );
    notifyListeners();
  }
  void tryToken({required String? token}) async{
    if(token==null){
      return ;
    }else{
      try {
        this._isLoggedIn=true;
        this._user=User.fromJson(_user as Map<String, dynamic>);
        print(_user);
      // this.token=token;
        this.storeToken(token:token);
        notifyListeners();
      }catch(e) {
      }
    }
  }
  void storeToken({required String token})async {
    this.storage.write(key:'token',value:token);
  }
  void storeUser({required  Map<String, dynamic> user}) async {
    await storage.write(key: 'user', value: json.encode(user));
  }

  readUser() async {
    var userJson = await storage.read(key: 'user');
    if (userJson != null) {
    //  final userMap = json.decode(userJson);
     // return User.fromJson(userMap).id; // Supposons que User possède un constructeur fromJson
    } else {
      throw Exception('Aucun utilisateur trouvé.');
    }
  }

}
