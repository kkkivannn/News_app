import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("News Application"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list_alt_rounded),
              ),
              Tab(
                icon: Icon(Icons.table_rows_rounded),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_rounded,
              ),
              label: 'Новости',
              tooltip: "News"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_rounded,
              ),
              label: 'Закладки',
              tooltip: "Marker"
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Lucky Punch!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
