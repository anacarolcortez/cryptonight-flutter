import 'package:cryptonight/ui/components/circular_progress.dart';
import 'package:cryptonight/repository/news_service.dart';
import 'package:cryptonight/ui/components/news_card.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List>(
            future: getAllNews(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Desculpe, houve um erro na conexão!'),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String title = snapshot.data?[index].title;
                      String source = snapshot.data?[index].name;
                      String urlImg = snapshot.data?[index].urlToImage;
                      String date = getDate(snapshot.data?[index].publishedAt);
                      return NewsCard(
                          title: title,
                          source: source,
                          date: date,
                          urlImg: urlImg);
                    });
              }
              return const ProgressCircle();
            }));
  }

  String getDate(String date) {
    DateTime publilshedAt = DateTime.parse(date);
    return "${publilshedAt.day}/${publilshedAt.month}/${publilshedAt.year}";
  }
}
