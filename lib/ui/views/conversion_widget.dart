import 'dart:async';

import 'package:cryptonight/model/currency_class.dart';
import 'package:cryptonight/webappi/awesome_service.dart';
import 'package:cryptonight/ui/components/conversion_results.dart';
import 'package:cryptonight/ui/components/custom_dropbox.dart';
import 'package:cryptonight/ui/components/custom_title.dart';
import 'package:flutter/material.dart';

class ConversionWidget extends StatefulWidget {
  const ConversionWidget({Key? key}) : super(key: key);

  @override
  State<ConversionWidget> createState() {
    return _ConversionWidget();
  }
}

class _ConversionWidget extends State<ConversionWidget> {
  final TextEditingController _valueController = TextEditingController();

  final List<String> _currencies = [
    'Bitcoin',
    'Ethereum',
    'Litecoin',
    'Dogecoin',
    'Ripple'
  ];

  String _selectedCurrency = 'Bitcoin';
  String _variation = '0';
  String _convertedValue = '--';
  late Currency _cripto;

  void selectCurrency(String value) {
    setState(() {
      _selectedCurrency = value;
    });
  }

  void getCurrencyData(String cryptoSelected, double multVal) async {
    _cripto = await getCryptoValueFromApi(cryptoSelected);
    Timer(const Duration(seconds: 1), () {
      double calculatedConversion = double.parse(_cripto.bid) * multVal;
      setState(() {
        _variation = _cripto.pctChange;
        _convertedValue = calculatedConversion.toStringAsFixed(2);
      });
    });
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
            TextFormField(
              controller: _valueController,
              decoration: const InputDecoration(
                labelText: 'Valor em R\$',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              maxLength: 10,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropBox(
              list: _currencies,
              selectedItem: _selectedCurrency,
              callback: selectCurrency,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('CONVERTER'),
                onPressed: () {
                  if (!_validateFields()) {
                    showAlertDialog(context);
                  } else {
                    String cryptoSelected = getCurrencyCode(_selectedCurrency);
                    double mult = double.parse(_valueController.text);
                    getCurrencyData(cryptoSelected, mult);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ConversionResults(
                convertedValue: _convertedValue, variation: _variation)
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    if (_valueController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ops"),
          content: const Text("Digite um valor para conversão"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  String getCurrencyCode(String selectedCurrency) {
    String currencyCode;
    switch (selectedCurrency) {
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
}
