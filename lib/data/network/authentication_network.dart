import 'dart:convert';
import 'package:architerone_student/app/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class AuthenticationNetworkServices {
  //! Instance of client
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": ""
  };

  Future<dynamic> signUp({
    required String studentEmail,
    required String studentPassword,
  }) async {
    final Uri uri = Uri.parse(ApiRoutes.baseUrl + "/auth/sign");
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "student_email": studentEmail,
          "student_password": studentPassword,
        }),
        headers: headers);
    // ignore: avoid_print
    final body = response.body;
    return body;
  }

  Future<dynamic> login({
    required String studentEmail,
    required String studentPassword,
  }) async {
    final Uri uri = Uri.parse(ApiRoutes.baseUrl + "/auth/login");
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "student_email": studentEmail,
          "student_password": studentPassword,
        }),
        headers: headers);
    // ignore: avoid_print
    final body = response.body;
    return body;
  }
}
