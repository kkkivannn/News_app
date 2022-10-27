import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/feature/domain/entitis/news_entiti.dart';

abstract class NewsRepository{
  Future<Either<Failure, NewsEntiti>> getNews(String endpoint);
}