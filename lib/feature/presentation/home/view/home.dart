import 'package:flutter/material.dart';
import 'package:news_app/feature/presentation/home/widgets/tab_news.dart';
import 'package:news_app/feature/presentation/markers/view/marker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  final List _pages = [
    const TabNews(),
    const MarkerPage(),
  ];
  void _onTapSelectedPage(int index) {
    setState(() {
      if (selectedPage == index) {
        return;
      }
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_rounded,
              color: selectedPage == 0 ? Colors.blue : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_rounded,
              color: selectedPage == 1 ? Colors.blue : Colors.grey,
            ),
            label: '',
          ),
        ],
        onTap: _onTapSelectedPage,
      ),
      body: _pages[selectedPage],
    );
  }
}
