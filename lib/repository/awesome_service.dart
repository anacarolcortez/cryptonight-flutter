import 'dart:convert';
import 'package:cryptonight/model/currency_class.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<Currency> getCryptoValueFromApi(String currency) async {
  List<String> currencyNameList = currency.split('-');
  String currencyName = currencyNameList[0] + currencyNameList[1];

  final response = await http
      .get(Uri.parse('https://economia.awesomeapi.com.br/json/last/$currency'));

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedCrypto = jsonDecode(response.body);

    String code = decodedCrypto[currencyName]['code'];
    String codein = decodedCrypto[currencyName]['codein'];
    String name = decodedCrypto[currencyName]['name'];
    String high = decodedCrypto[currencyName]['high'];
    String low = decodedCrypto[currencyName]['low'];
    String varBid = decodedCrypto[currencyName]['varBid'];
    String pctChange = decodedCrypto[currencyName]['pctChange'];
    String bid = decodedCrypto[currencyName]['bid'];
    String ask = decodedCrypto[currencyName]['ask'];
    String timestamp = decodedCrypto[currencyName]['timestamp'];
    String createDate = decodedCrypto[currencyName]['create_date'];

    Currency cryptoSelected = Currency(
        code: code,
        codein: codein,
        name: name,
        high: high,
        low: low,
        varBid: varBid,
        pctChange: pctChange,
        bid: bid,
        ask: ask,
        timestamp: timestamp,
        createDate: createDate);
    debugPrint(
        'Request: ${cryptoSelected.name} ${cryptoSelected.bid}, ${cryptoSelected.pctChange}, ${cryptoSelected.timestamp}');
    return cryptoSelected;
  } else {
    throw Exception('Failed to load album');
  }
}
