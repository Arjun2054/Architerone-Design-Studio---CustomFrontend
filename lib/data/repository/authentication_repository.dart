import 'dart:convert';
import 'package:architerone_student/data/network/authentication_network.dart';


class AuthenticationRepository {
  final AuthenticationNetworkServices authenticationNetworkServices;

  AuthenticationRepository({required this.authenticationNetworkServices});

  Future<dynamic> signUp({
    required String studentEmail,
    required String studentPassword,
  }) async {
    var response = await authenticationNetworkServices.signUp(
        studentEmail: studentEmail, studentPassword: studentPassword);
    //Decode the value
    final Map<String, dynamic> parseData = jsonDecode(response.toString());
    print(parseData);
    return parseData;
  }

  Future<dynamic> login({
    required String studentEmail,
    required String studentPassword,
  }) async {
   var response = await  authenticationNetworkServices.login(
        studentEmail: studentEmail, studentPassword: studentPassword);
    //Decode the value
    final Map<String, dynamic> parseData = jsonDecode(response.toString());
    print(parseData);
    return parseData;
  }
}
