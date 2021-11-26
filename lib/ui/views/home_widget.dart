import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:cryptonight/ui/views/conversion_widget.dart';
import 'news_list_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ConversionWidget(),
    Text(
      'Pg com Gráficos de Evolução',
    ),
    NewsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptonight'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.paid_outlined, title: "Conversão"),
          TabData(iconData: Icons.show_chart_outlined, title: "Evolução"),
          TabData(iconData: Icons.article_outlined, title: "Notícias"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            _selectedIndex = position;
          });
        },
        barBackgroundColor: Colors.yellowAccent[700],
        circleColor: Colors.black,
        activeIconColor: Colors.white,
      ),
    );
  }
}
