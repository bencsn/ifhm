import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifhm/screens/auth/createProject.dart';
import 'package:ifhm/screens/auth/signIn.dart';

class AuthEntry extends StatefulWidget {
  @override
  _AuthEntryState createState() => _AuthEntryState();
}

class _AuthEntryState extends State<AuthEntry> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton.filled(
                onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()))
                    },
                child: Text("Sign in to a project")),
            SizedBox(
              height: 10,
            ),
            CupertinoButton.filled(
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateProject()))
                    },
                child: Text("New Project"))
          ],
        ));
  }
}
