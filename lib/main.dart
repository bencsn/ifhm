import 'package:flutter/material.dart';
import 'package:ifhm/models/AuthModel.dart';
import 'package:ifhm/screens/auth/authEntry.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(create: (_) => AuthModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        home: Scaffold(
          appBar: AppBar(
            title: Text("I fucking hate money"),
            actions: <Widget>[
              FlatButton(
                onPressed: () => {},
                child: Text("Projects"),
                textColor: Colors.white,
              )
            ],
          ),
          body: AuthEntry(),
        ),
      ),
    );
  }
}
