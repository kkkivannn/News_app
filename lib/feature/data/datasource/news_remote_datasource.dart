

import 'package:news_app/feature/data/models/news_model.dart';

abstract class NewsRemoteDatasource{
  Future<NewsModel>getNews(String endpoint);
}