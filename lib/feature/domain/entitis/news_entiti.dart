import 'package:news_app/feature/domain/entitis/article_entiti.dart';

class NewsEntiti {
  final String status;
  final int totalResults;
  final List<ArticleEntiti> articles;

  NewsEntiti({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}
