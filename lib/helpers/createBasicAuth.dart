import 'dart:convert';

String createBasicAuth(String currentProjectCredentials) {
  Map<String, dynamic> encodedCred = json.decode(currentProjectCredentials);
  String username = encodedCred["id"];
  String password = encodedCred["password"];
  print(username + " " + password);
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  return basicAuth;
  // return '$username:$password';
}
