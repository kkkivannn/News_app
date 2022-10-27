import 'package:news_app/feature/data/models/article_model.dart';
import 'package:news_app/feature/domain/entitis/article_entiti.dart';
import 'package:news_app/feature/domain/entitis/news_entiti.dart';

class NewsModel extends NewsEntiti {
  NewsModel({
    required final String status,
    required final int totalResults,
    required final List<ArticleEntiti> articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles,
        );
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"] as String,
        totalResults: json["totalResults"] as int,
        articles: List<ArticleModel>.from(
          (json["articles"] as List<dynamic>)
              .map((x) => ArticleModel.fromJson(x))
              .toList(),
        ),
      );
}
