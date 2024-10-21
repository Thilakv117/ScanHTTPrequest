import 'package:flutter/material.dart';
import 'package:project_two/services/httpGetRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<getData> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            print(user.serialNumber.toString());
            return ListTile(
              leading: Text(user.serialNumber.toString()),
              title: Text(user.qr1_completed_time.toString()),
              trailing: Text(user.qr1_completed.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Text("Data"),
      ),
    );
  }

  Future<void> fetchData() async {
    final String url =
        "https://microtechbackend.onrender.com/get_all_stage_completions/";
    final uri = await http.get(Uri.parse(url));
    final data = jsonDecode(uri.body) as List<dynamic>;
    final result = data as List<dynamic>;
    final transformed = result.map((e) => getData.fromJson(e)).toList();
    setState(() {
      users = transformed;
    });
  }
}
