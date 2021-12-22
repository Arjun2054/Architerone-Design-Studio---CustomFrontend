import 'package:architerone_student/app/routes/app_routes.dart';
import 'package:architerone_student/custom_bloc_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Core());
}

class Lava extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
