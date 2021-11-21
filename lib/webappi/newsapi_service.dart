import 'package:http/http.dart' as http;

Future<void> getAllNews() async {
  String url = 'https://newsapi.org/v2/everything?q=criptomoeda&sortBy=popularity&apiKey=c459e9d63695424b9d1afd86b80581b0';

  final response = await http
      .get(Uri.parse(url));
}
