

import 'package:flutter/material.dart';
import 'package:project_two/MainPage.dart';
import 'package:flutter/foundation.dart';

void main()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
  
}