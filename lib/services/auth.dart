import 'package:maestros/utils/server.dart';
import 'dart:convert';

class Auth {

  static String Token;
  
  static Future<String> signIn(String username, String password) async {
    try {
      var uri = Uri.http(Server.URL, "/api/loginmaestros");
      var response = await Server.client.post(uri, body: {
        "Username": username,
        "Password": password
      });

      print(response.statusCode);
      
      Map<String,dynamic> decode = jsonDecode(response.body);
      Token = decode['token'];
      print('Token: $Token');
      return response.statusCode.toString();  
    } catch (e) {
      print(e);
    }
    
  }

}