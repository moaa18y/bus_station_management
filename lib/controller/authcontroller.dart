import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthController {
  Future loginAuth(mobile, pass) async {
    var url = "http://localhost:4000/api/passenger/login";
    var res = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{"mobile": mobile, "pass": pass}),
        headers: {"Content-Type": "application/json"});
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      return data;
    }
  }
}
