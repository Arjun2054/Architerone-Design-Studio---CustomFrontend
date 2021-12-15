import 'package:architerone_student/presentation/views/authentication/login_view.dart';
import 'package:architerone_student/presentation/views/authentication/signup_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        {
          return MaterialPageRoute(builder: (_) => const LoginView());
        }

      case "/signup":
        {
          return MaterialPageRoute(builder: (_) => const SignupView());
        }
    }
  }
}
