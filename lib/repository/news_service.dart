import 'dart:convert';
import 'package:cryptonight/model/articles_class.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getAllNews() async {
  String url =
      'https://newsapi.org/v2/everything?q=criptomoeda&sortBy=popularity&apiKey=c459e9d63695424b9d1afd86b80581b0';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List articles = jsonDecode(response.body)['articles'] ?? [];
    var breakinNews = articles.map((e) => Article.fromMap(e)).toList();
    return breakinNews;
  } else {
    throw Exception('Failed to load news');
  }
}
