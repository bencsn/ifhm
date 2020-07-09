import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ifhm/screens/bills/allBills.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final _formKey = GlobalKey<FormState>();
  String contactEmail = "";
  String name = "";
  String password = "";
  String id = "";

  void create() async {
    // Validate will return true if the form is valid, or false if
    // the form is invalid.
    if (_formKey.currentState.validate()) {
      // Process data.
      var data = {
        "contact_email": contactEmail,
        "name": name,
        "id": id,
        "password": password
      };
      var url = 'https://ihatemoney.org/api/projects';
      var response = await http.post(url, body: data);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      bool res = await storeCredentials(id, password);
      if (res) {
        Navigator.pushReplacement(
            context, new MaterialPageRoute(builder: (context) => AllBills()));
      }
    }
  }

  Future<bool> storeCredentials(id, password) async {
    // Create storage
    final storage = new FlutterSecureStorage();

    // Get all credentials
    String creds = await storage.read(key: "creds");
    List credsList = [];
    if (creds != null) {
      credsList = json.decode(creds);
    }
    Map<String, String> current = {"id": id, "password": password};
    credsList.add(current);
    // Store password
    await storage.write(key: "creds", value: json.encode(credsList));
    await storage.write(key: "currentProject", value: json.encode(current));

    // Read value
    String newCreds = await storage.read(key: "creds");
    print(newCreds);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                onChanged: (value) {
                  setState(() {
                    contactEmail = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter project identifier',
                ),
                onChanged: (value) {
                  setState(() {
                    id = value;
                    name = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your project identifier';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              CupertinoButton.filled(
                onPressed: create,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
