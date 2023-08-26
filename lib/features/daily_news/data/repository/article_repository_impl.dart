import 'package:news/features/daily_news/data/models/article.dart';
import 'package:news/features/daily_news/domain/entities/article.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/domain/repository/article_repositry.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
