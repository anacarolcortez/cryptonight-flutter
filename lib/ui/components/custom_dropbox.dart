import 'package:flutter/material.dart';

class CustomDropBox extends StatefulWidget {
  final List<String> list;
  String selectedItem;
  final void Function(String) callback;

  CustomDropBox(
      {Key? key,
      required this.list,
      required this.selectedItem,
      required this.callback})
      : super(key: key);

  @override
  State<CustomDropBox> createState() => _CustomDropBoxState();
}

class _CustomDropBoxState extends State<CustomDropBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            itemHeight: 50.0,
            hint: const Text('Criptomoeda'),
            value: widget.selectedItem,
            items: widget.list.map((currency) {
              return DropdownMenuItem(
                child: Text(currency),
                value: currency,
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                widget.selectedItem = newValue as String;
              });
              widget.callback(newValue as String);
            }),
      ),
    );
  }
}
