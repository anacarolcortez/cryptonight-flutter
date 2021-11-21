import 'package:flutter/material.dart';

class ConversionResults extends StatelessWidget {
  final String convertedValue;
  final String variation;

  const ConversionResults(
      {Key? key, required this.convertedValue, required this.variation})
      : super(key: key);
  //will become statefull soon. finishing  api request first

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 170,
          height: 60,
          child: Card(
            child: Center(
              child: Card(
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
        SizedBox(
          width: 70,
          height: 60,
          child: Center(
              child: Row(
            children: [
              Icon(
                Icons.arrow_drop_up_rounded,
                color: Colors.greenAccent[400],
                size: 40,
              ),
              Text(
                variation,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
