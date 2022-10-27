import 'package:flutter/material.dart';
import 'package:news_app/core/utils/saved_news.dart';

import '../../list_news_top_headlines/widgets/news_card.dart';

class MarkerPage extends StatelessWidget {
  const MarkerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SavedNews savedNews = SavedNews();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Saved News",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        itemCount: savedNews.newsSaved.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              '/NewsViewPage',
              arguments: {
                'title': savedNews.newsSaved[index]['title'],
                'content': savedNews.newsSaved[index]['content'],
                'url': savedNews.newsSaved[index]['url'],
                'isSaved': false,
              },
            ),
            child: NewsCard(
              title: savedNews.newsSaved[index]['title'],
            ),
          );
        },
      ),
    );
  }
}
