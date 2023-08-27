import 'dart:io';
import 'package:dio/dio.dart';

import 'package:news/core/constants/constants.dart';
import 'package:news/features/daily_news/data/models/article.dart';
import 'package:news/features/daily_news/domain/entities/article.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/domain/repository/article_repositry.dart';

import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.unknown,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
