import 'package:cryptonight/ui/views/home_widget.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash_cover.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Icon(Icons.arrow_forward_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeWidget()),
          );
        },
      ),
    );
  }
}
