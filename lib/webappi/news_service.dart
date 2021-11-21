import 'dart:convert';
import 'package:cryptonight/model/articles_class.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getAllNews() async {
  String url =
      'https://newsapi.org/v2/everything?q=criptomoeda&sortBy=popularity&apiKey=c459e9d63695424b9d1afd86b80581b0';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //Map<List<String,dynamic>>  decodedArticles = jsonDecode(response.body);
    
    List<Article> lisfOfArticles = [];

      // String source = decodedArticles['articles']['source']['name'];
      // String title = decodedArticles['articles']['title'];
      // String description = decodedArticles['articles']['description'];
      // String url = decodedArticles['articles']['url'];
      // String urlToImage = decodedArticles['articles']['urlToImage'];
      // String content = decodedArticles['articles']['content'];
      // String publishedAt = decodedArticles['articles']['publishedAt'];

      // Article article = Article(
      //     source: source,
      //     title: title,
      //     description: description,
      //     url: url,
      //     urlToImage: urlToImage,
      //     publishedAt: publishedAt,
      //     content: content);

      // lisfOfArticles.add(article);

    return lisfOfArticles;
  } else {
    throw Exception('Failed to load news');
  }
}
