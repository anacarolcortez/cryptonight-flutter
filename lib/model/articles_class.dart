import 'dart:convert';

class Article{

  String name;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;


  Article({
    required this.name,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      name: map["source"]['name'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }


  factory Article.fromJson(String source) => Article.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());

}