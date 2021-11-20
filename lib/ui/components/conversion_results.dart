import 'package:flutter/material.dart';

class ConversionResults extends StatelessWidget {
  const ConversionResults({Key? key}) : super(key: key);
  //will become statefull soon. finishing  api request first

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 170,
          height: 60,
          child: Card(
            child: Center(
              child: Card(
                child: Text(
                  '0,030',
                  style: TextStyle(
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
                '2%',
                style: TextStyle(
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
