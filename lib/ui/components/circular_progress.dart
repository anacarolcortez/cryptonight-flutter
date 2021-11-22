import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const CircularProgressIndicator(),
        Text(
          'Carregando...',
          style: TextStyle(color: Colors.blueGrey[900]),
        )
      ],
    ));
  }
}
