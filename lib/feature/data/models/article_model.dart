import 'package:news_app/feature/data/models/source_model.dart';
import 'package:news_app/feature/domain/entitis/article_entiti.dart';
import 'package:news_app/feature/domain/entitis/source_entiti.dart';

class ArticleModel extends ArticleEntiti {
  ArticleModel({
    required final SourceEntiti source,
    required final String author,
    required final String title,
    required final String description,
    required final String url,
    required final String urlToImage,
    required final DateTime publishedAt,
    required final String content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );
  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] as String,
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "",
      );
}
