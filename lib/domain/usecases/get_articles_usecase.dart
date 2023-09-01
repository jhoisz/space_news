import '../entities/article.dart';

abstract class IGetArticlesUsecase {
  Future<List<Article>> getArticles();
}