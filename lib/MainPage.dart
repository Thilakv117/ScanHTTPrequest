// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_two/NewPage/getData.dart';
import 'package:project_two/services/PostRequest.dart';
import 'package:project_two/services/httpGetRequest.dart';
import 'package:project_two/services/httpModel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'NewPage/ScanPage.dart';
import 'package:project_two/services/PostRequest.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  set value(String? value) {}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<getData> user = [];
  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanPage()),
              );
            },
            child: Text("Scan QR"),
          ),
          SizedBox(height: 10,),
          
        ],
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
        }, child: Text("Show data")),
      ),
    );
  }
}
