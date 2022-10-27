import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../domain/entitis/news_entiti.dart';
import '../../domain/repositories/news.dart';
import '../datasource/news_remote_datasource.dart';
import '../models/news_model.dart';

class NewsRepositoryImplement implements NewsRepository {
  final NewsRemoteDatasource newsRemoteDatasource;

  NewsRepositoryImplement(this.newsRemoteDatasource);
  @override
  Future<Either<Failure, NewsEntiti>> getNews(String endpoint) async {
    return await _getNews(
      () => newsRemoteDatasource.getNews(endpoint),
    );
  }

  Future<Either<Failure, NewsModel>> _getNews(
      Future<NewsModel> Function() news) async {
    try {
      final newsModel = await news();
      return Right(newsModel);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
