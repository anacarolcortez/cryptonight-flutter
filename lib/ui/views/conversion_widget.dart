import 'package:flutter/material.dart';
import 'package:cryptonight/ui/components/conversion_results.dart';
import 'package:cryptonight/ui/components/custom_textfield.dart';
import 'package:cryptonight/ui/components/custom_dropbox.dart';
import 'package:cryptonight/ui/components/custom_button.dart';
import 'package:cryptonight/ui/components/custom_title.dart';

class ConversionWidget extends StatefulWidget {
  const ConversionWidget({Key? key}) : super(key: key);

  @override
  State<ConversionWidget> createState() {
    return _ConversionWidget();
  }
}

class _ConversionWidget extends State<ConversionWidget> {
  final List<String> _currencies = [
    'Bitcoin',
    'Ethereum',
    'Litecoin',
    'Dogecoin',
    'Ripple'
  ];
  // Option 2
  String _selectedCurrency = 'Bitcoin';

  void selectCurrency(String value) {
    setState(() {
      _selectedCurrency = value;
    });
  }

  String convertValue() {
    String currencyCode;
    switch (_selectedCurrency) {
      case 'Ethereum':
        currencyCode = 'ETH-BRL';
        break;
      case 'Litecoin':
        currencyCode = 'LTC-BRL';
        break;
      case 'Dogecoin':
        currencyCode = 'DOGE-BRL';
        break;
      case 'Ripple':
        currencyCode = 'XRP-BRL';
        break;
      default:
        currencyCode = 'BTC-BRL';
    }
    return currencyCode;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 70.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTitle(title: 'Conversor de Criptomoedas'),
            const SizedBox(
              height: 24,
            ),
            const CustomTextField(),
            const SizedBox(
              height: 8,
            ),
            CustomDropBox(list: _currencies, selectedItem: _selectedCurrency, callback: selectCurrency,),
            const SizedBox(
              height: 32,
            ),
            CustomButton(label: 'CONVERTER', action: convertValue),
            const SizedBox(
              height: 24,
            ),
            const ConversionResults(),
          ],
        ),
      ),
    );
  }
}
