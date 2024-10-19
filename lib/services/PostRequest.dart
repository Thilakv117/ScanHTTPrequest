import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> submitData() async {
  final url = "https://microtechbackend.onrender.com/update_stage/";
  final uri = Uri.parse(url);
  final body = {"serial_number": "s001", "stage": "Qr3"};
   final response = await http.post(uri, body: json.encode(body));
  print(response.statusCode);
}
