import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_two/services/httpModel.dart';

String uri = "https://microtechbackend.onrender.com/get_all_stage_completions/";
Future fetchData() async {
  final response = await http.get(Uri.parse(uri));
  final data = jsonDecode(response.body);
  return data;
}