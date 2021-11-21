import 'dart:convert';
import 'package:cryptonight/model/currency_class.dart';
import 'package:http/http.dart' as http;

Future<Currency> getCoinValue(String currency) async {
  List<String> currencyNameList = currency.split('-');
  String currencyName = currencyNameList[0]+currencyNameList[1];

  final response = await http
      .get(Uri.parse('https://economia.awesomeapi.com.br/json/last/$currency'));
  print(response.body);

  if (response.statusCode == 200) {
    return Currency.fromJson(jsonDecode(response.body), currencyName);
  } else {
    throw Exception('Failed to fetch data from server');
  }
}
