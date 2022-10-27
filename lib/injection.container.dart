import 'package:get_it/get_it.dart';
import 'package:news_app/feature/data/datasource/news_remote_datasource.dart';
import 'package:news_app/feature/data/datasource/news_remote_datasource_implement.dart';
import 'package:news_app/feature/data/repository/news_implement.dart';
import 'package:news_app/feature/domain/repositories/news.dart';
import 'package:news_app/feature/domain/usecases/get_news.dart';
import 'package:news_app/feature/presentation/list_news_everything/controller/list_news_everythings_cubit.dart';
import 'package:news_app/feature/presentation/list_news_top_headlines/controller/list_news_top_headlines_cubit.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(() => TabTopHeadlinesCubit(getNews: sl()));
  sl.registerFactory(() => TabEverythingsCubit(getNews: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetNews(sl()));
  //Repository
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImplement(sl()));
  //Datasource
  sl.registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasourceImplement());
}
