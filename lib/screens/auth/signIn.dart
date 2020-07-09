import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifhm/helpers/isValidCredentials.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  String id = "";

  void signIn() async {
    if (_formKey.currentState.validate()) {
      // Send a request to bills;
      // if it returns a valid response, save credentials to keychain
      isValidCredentials(id, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Project identifier',
                ),
                onChanged: (value) {
                  setState(() {
                    id = value;
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
                  hintText: 'Private code',
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your private code';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton.filled(
                onPressed: signIn,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
