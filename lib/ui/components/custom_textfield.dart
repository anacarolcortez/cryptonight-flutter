import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final TextEditingController _valueController = TextEditingController();
    
    return TextFormField(
      controller: _valueController,
      decoration: const InputDecoration(
        labelText: 'Valor em R\$',
        labelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      maxLength: 8,
    );
  }
}
