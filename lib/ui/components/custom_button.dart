import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback action;

  const CustomButton({Key? key, required this.label, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: action,
        child: Text(label),
      ),
    );
  }
}
