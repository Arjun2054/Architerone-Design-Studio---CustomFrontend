import 'package:architerone_student/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
