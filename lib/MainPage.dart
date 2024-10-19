// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_two/services/PostRequest.dart';
import 'package:project_two/services/httpGetRequest.dart';
import 'package:project_two/services/httpModel.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'NewPage/ScanPage.dart';
import 'package:project_two/services/PostRequest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  set value(String? value){}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Project> user = [];
  @override
  void initState() {
    super.initState();
    // fetchData();
    submitData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("QR Generator"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScanPage()),
            );
          },
          child: Text("Scan QR"),
        ),
        body: ListView.builder(itemCount: user.length,itemBuilder: (context, index){
          return Text(user as String);
        }),
        );
  }
}
