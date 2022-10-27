import 'package:flutter/material.dart';
import 'package:news_app/core/utils/saved_news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatefulWidget {
  final String title;
  final String content;
  final String url;
  final bool isSaved;
  const NewsView({
    Key? key,
    required this.title,
    required this.content,
    required this.url,
    required this.isSaved,
  }) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final SavedNews _savedNews = SavedNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'News Application',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            !widget.isSaved
                ? Container()
                : TextButton(
                    onPressed: () {
                      setState(() {
                        _savedNews.saveNews(
                            widget.title, widget.content, widget.url);
                      });
                    },
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          widget.content == ""
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.content,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () async {
                if (!await launchUrl(
                  Uri.parse(widget.url),
                  mode: LaunchMode.inAppWebView,
                )) {
                  throw 'Could not launch ${widget.url}';
                }
              },
              child: Text(widget.url),
            ),
          ),
        ],
      ),
    );
  }
}
