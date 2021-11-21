import 'package:cryptonight/ui/components/custom_title.dart';
import 'package:cryptonight/webappi/news_service.dart';
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
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const CustomTitle(title: 'Últimas Notícias'),
        FutureBuilder<List>(
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
                      return ListTile(
                        title: Text('Teste'),
                      );
                    });
              }
              return const CircularProgressIndicator();
            })
      ]),
    );
  }
}
