import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/feature/domain/entitis/news_entiti.dart';
import 'package:news_app/feature/domain/repositories/news.dart';

class GetNews implements UseCase<NewsEntiti, EndpointParams> {
  final NewsRepository newsRepository;

  GetNews(this.newsRepository);
  @override
  Future<Either<Failure, NewsEntiti>> call(EndpointParams params) async {
    return await newsRepository.getNews(params.endpoint);
  }
}

class EndpointParams extends Equatable {
  final String endpoint;

  const EndpointParams({
    required this.endpoint,
  });
  @override
  List<Object?> get props => [endpoint];
}
