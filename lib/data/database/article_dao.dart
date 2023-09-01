import 'package:floor/floor.dart';
import 'package:space_news/domain/entities/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * from Article')
  Future<List<Article>> getArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}