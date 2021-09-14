import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:io';
import 'dart:convert';


// 1. GET Client Credentials
Future getClientCredentials() async {
  String _username = 'bHXmBhK2m2WqvOIUPOWuud9Y3xDnUGuJ';
  String _password = 'SWn6991aGUAiQz6W';

  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
  print('Basic Auth: $basicAuth');

  final response = await http.get(
    Uri.parse('https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'),
    headers: {'authorization': basicAuth}
  );

  final jsonResponse = jsonDecode(response.body);
  print('JSON Response: $jsonResponse');

  return AccessCredentials.fromJson(jsonResponse);
}

class AccessCredentials{
  final accessToken;
  final expiresIn;

  AccessCredentials({this.accessToken, this.expiresIn});

  factory AccessCredentials.fromJson(Map<String, dynamic> json){
    return AccessCredentials(accessToken: json["access_token"], expiresIn: json['expires_in'],
    );
  }
}

// 2. POST req => to process M-PESA Request
Future processRequest() async {
   final accessCredentials = await getClientCredentials();

   print(accessCredentials.accessToken);
}
