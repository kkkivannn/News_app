import 'package:news_app/constants.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/feature/data/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'news_remote_datasource.dart';

class NewsRemoteDatasourceImplement implements NewsRemoteDatasource{
  Dio _dio = Dio();
  NewsRemoteDatasourceImplement() {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
    initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
  @override
  Future<NewsModel> getNews(String endpoint) async {
    final response = await _dio.get(endpoint);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    }else{
      throw ServerException();
    }
  }

}