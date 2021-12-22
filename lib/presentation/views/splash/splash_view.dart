import 'dart:async';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future _initialCache() async {
    CacheManagerUtils.conditionalCache(
        key: "jwt",
        valueType: ValueType.StringValue,
        actionIfNull: () {
          Navigator.of(context).pushNamed("/login");
        },
        actionIfNotNull: () {
          Navigator.of(context).pushNamed("/home");
        });
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), _initialCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text("Architerone Design Studio"),
        ),
      ),
    );
  }
}
