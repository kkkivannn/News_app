import 'package:flutter/material.dart';
import 'package:news_app/feature/presentation/list_news_top_headlines/view/list_news_top_headlines.dart';

import '../../list_news_everything/view/list_news_everythings.dart';

class TabNews extends StatelessWidget {
  const TabNews({Key? key}) : super(key: key);

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
        body: const TabBarView(
          children: [
            TabTopHeadlinesList(),
            TabEverythingsList(),
          ],
        ),
      ),
    );
  }
}
