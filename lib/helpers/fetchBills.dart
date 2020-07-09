import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'createBasicAuth.dart';

Future<List> fetchBills() async {
  try {
    final storage = new FlutterSecureStorage();
    String currentProject = await storage.read(key: "currentProject");
    Map<String, dynamic> decodedCurrentProject = json.decode(currentProject);
    String currentProjectName = decodedCurrentProject["id"];
    String url =
        "https://ihatemoney.org/api/projects/$currentProjectName/bills";
    print(url);
    String basicAuth = createBasicAuth(currentProject);
    print(basicAuth);

    dio.Response data = await dio.Dio().get(url,
        options:
            dio.Options(headers: <String, String>{'authorization': basicAuth}));

    print(data.data);
    return data.data;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List> fetchBillsWithCustomCredentials(String id, String password) async {
  // TODO: exception error crashses the app; fix it!
  try {
    String currentProjectName = id;
    String url =
        "https://ihatemoney.org/api/projects/$currentProjectName/bills";
    print(url);
    String currentProject = '{"id":"$id", "password":"$password"}';
    String basicAuth = createBasicAuth(currentProject);
    print(basicAuth);

    dio.Response data = await dio.Dio().get(url,
        options:
            dio.Options(headers: <String, String>{'authorization': basicAuth}));

    print(data.statusCode);
    return data.data;
  } catch (e) {
    print(e);
    return [];
  }
}
