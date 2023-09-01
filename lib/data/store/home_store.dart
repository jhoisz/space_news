import 'package:mobx/mobx.dart';

import '../../controllers/article_dao_controller.dart';
import '../../domain/entities/article.dart';

part 'home_store.g.dart';

class HomeStore extends _HomeStoreBase with _$HomeStore {}

abstract class _HomeStoreBase with Store {
  final DaoController daoController = DaoController();
  ObservableList<Article> favoritesList = ObservableList<Article>();

  _HomeStoreBase() {
    getFavorites();
  }

  @action
  Future<void> getFavorites() async {
    favoritesList = (await daoController.getArticles()).asObservable();
  }

  @action
  void setFavorite(Article article) {
    favoritesList.add(article);

    daoController.addArticle(
      article: article,
    );
  }

  @action
  void removeFavorite(Article article) {
    favoritesList.removeWhere((e) => e.id == article.id);

    daoController.removeArticle(
      article: article,
    );
  }
}
