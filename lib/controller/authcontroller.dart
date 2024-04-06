import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthController {
  Future loginAuth(mobile, pass) async {
    var url = "http://localhost:4000/api/passenger/login";
    var res = await http.post(Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
        body: jsonEncode(<String, String>{"mobile": mobile, "pass": pass}),

        );
    if (res.statusCode == 200) {
      // Handle successful sign-in
      // You can parse the response body and perform actions based on that
      var data = jsonDecode(res.body);

      return data;
    }else {
      // Handle errors
      throw Exception('Failed to sign in user');
    }
  }
}
