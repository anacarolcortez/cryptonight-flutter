import 'package:flutter/material.dart';

class ConversionResults extends StatelessWidget {
  final String convertedValue;
  final String variation;

  const ConversionResults(
      {Key? key, required this.convertedValue, required this.variation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  convertedValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  positive(variation)
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: positive(variation)
                      ? Colors.greenAccent[400]
                      : Colors.red,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  variation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  bool positive(String value) {
    double val = double.parse(value);
    if (val >= 0.0) {
      return true;
    }
    return false;
  }
}
