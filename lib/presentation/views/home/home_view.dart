import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Succesfull created Authentication"),
            ElevatedButton.icon(
                onPressed: () {
                  DeleteCache.deleteKey(
                      "jwt", Navigator.of(context).pushNamed("/login"));
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
