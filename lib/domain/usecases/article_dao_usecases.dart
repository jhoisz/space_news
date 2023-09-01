import '../entities/article.dart';

abstract class ArticleDaoUsecase {
  Future<List<Article>> getArticles();
  
  Future<void> addArticle({required Article article});

  Future<void> removeArticle({required Article article});

}