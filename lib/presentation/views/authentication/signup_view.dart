import 'package:architerone_student/data/network/authentication_network.dart';
import 'package:architerone_student/data/repository/authentication_repository.dart';
import 'package:architerone_student/domain/cubit/authentication/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    AuthenticationRepository authenticationRepository =
        AuthenticationRepository(
            authenticationNetworkServices: AuthenticationNetworkServices());

    AuthenticationCubit authenticationCubit =
        BlocProvider.of<AuthenticationCubit>(context, listen: false);

    Widget signupForm() {
      return Container(
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
                
                 String studentEmail = emailController.text;
                  String studentPassword = passwordController.text;
                  authenticationCubit.signup(
                      context: context,
                      studentEmail: studentEmail,
                      studentPassword: studentPassword);
                },
                child: const Text("Signup"))
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("SignUp"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login");
          },
          child: const Icon(Icons.backpack_rounded),
        ),
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              return signupForm();
            },
            listener: (context, state) {
               if (state is AuthenticationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
           if (state is AuthenticationCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Signup is successfull : ${state.response}"),
              ),
            );
          }
            }));
  }
}
