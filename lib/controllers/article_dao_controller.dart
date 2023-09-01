import '../data/database/article_dao.dart';
import '../data/database/database.dart';
import '../domain/entities/article.dart';
import '../domain/usecases/article_dao_usecases.dart';

class DaoController implements ArticleDaoUsecase {
  Future<ArticleDao> createDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final ArticleDao articleDao = database.articleDao;

    return articleDao;
  }

  @override
  Future<void> addArticle({required Article article}) async {
    final ArticleDao articleDao = await createDatabase();
    articleDao.addArticle(article);
  }


  @override
  Future<List<Article>> getArticles() async {
   final ArticleDao articleDao = await createDatabase();

   return articleDao.getArticles();
  }

  @override
  Future<void> removeArticle({required Article article}) async {
    final ArticleDao articleDao = await createDatabase();
    articleDao.deleteArticle(article);
  }
}
