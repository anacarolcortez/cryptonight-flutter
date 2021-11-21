import 'dart:convert';
import 'package:cryptonight/model/articles_class.dart';
import 'package:http/http.dart' as http;

Future<List<Articles>> getAllNews() async {
  String url =
      'https://newsapi.org/v2/everything?q=criptomoeda&sortBy=popularity&apiKey=c459e9d63695424b9d1afd86b80581b0';

  final response = await http.get(Uri.parse(url));

  List<Articles> lisfOfArticles = [];

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedArticles = jsonDecode(response.body);
    //print(decodedArticles.entries.toString());
    lisfOfArticles = List.from(decodedArticles['articles'])
        .map((e) => Articles.fromJson(e))
        .toList();
    print(lisfOfArticles.length);
    //corrigir: precisa criar instâncias de Article com base nos dados da lista e adicionálos na lista final a ser retornada;
    return lisfOfArticles;
  } else {
    throw Exception('Failed to load news');
  }
}
