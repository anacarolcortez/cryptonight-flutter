import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
