import 'package:flutter/material.dart';
import 'package:cryptonight/ui/views/conversion_widget.dart';
import 'news_widget.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptonight'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.paid_outlined),
            label: 'Conversão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: 'Evolução',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Notícias',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.yellowAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
