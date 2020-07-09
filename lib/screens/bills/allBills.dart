import 'dart:convert';
import "package:dio/dio.dart" as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifhm/helpers/createBasicAuth.dart';
import 'package:ifhm/helpers/fetchBills.dart';

class AllBills extends StatefulWidget {
  @override
  _AllBillsState createState() => _AllBillsState();
}

class _AllBillsState extends State<AllBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All bills"),
      ),
      body: FutureBuilder<List>(
        future: fetchBills(),
        builder: (context, snapshot) {
          print(snapshot.data);
          return ListView(
            children: <Widget>[
              if (snapshot.data.length > 0)
                ...snapshot.data.map((e) => Text("ok")).toList()
              else ...[Text("No bills :(")]
            ],
          );
        },
      ),
    );
  }
}
