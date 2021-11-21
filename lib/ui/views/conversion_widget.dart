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
  // Option 2
  String _selectedCurrency = 'Bitcoin';
  String _convertedValue = '0.00';
  String _variation = '0';

  void selectCurrency(String value) {
    setState(() {
      _selectedCurrency = value;
    });
  }

  void upteResults(String currecyVal, String pct) {
    setState(() {
      _convertedValue = currecyVal;
      _variation = pct;
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
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
                  if (_validateFields()) {
                    String code = getCurrencyCode();
                    FutureBuilder<Currency>(
                        future: getCoinValue(code),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String value = snapshot.data!.currencydata.bid;
                            _variation =
                                '${snapshot.data!.currencydata.pctChange} %';
                            _convertedValue = getCalculatedValue(value);
                          }
                          return const CircularProgressIndicator();
                        });
                  } else {
                    showAlertDialog(context);
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

  String getCurrencyCode() {
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

  String getCalculatedValue(String value) {
    double coinValue = double.parse(value);
    double multiplyby = double.parse(_valueController.text);
    double result = coinValue * multiplyby;
    return '$result';
  }
}
