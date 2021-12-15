import 'package:architerone_student/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthenticationRepository authenticationRepository =
        AuthenticationRepository();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/signup");
        },
        child: const Icon(Icons.next_plan),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter Email",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  authenticationRepository.login(
                      studentEmail: emailController.text,
                      studentPassword: passwordController.text);
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
