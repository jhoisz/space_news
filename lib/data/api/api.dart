import 'package:dio/dio.dart';

import '../../domain/entities/article.dart';
import '../../domain/usecases/get_articles_usecase.dart';

class Api implements IGetArticlesUsecase {
  final Dio dio = Dio();
  final String url = 'https://api.spaceflightnewsapi.net/v4/articles/';

  String? nextUrl;

  @override
  Future<List<Article>> getArticles({bool getNextUrl = false}) async {
    late Response response;

    if (getNextUrl && nextUrl != null) {
      response = await dio.get(nextUrl!);
    } else {
      response = await dio.get(url);
    }

    nextUrl = response.data['next'];
    final list = List<Article>.from(
      response.data['results'].map(
        (e) => Article.fromMap(e),
      ),
    );

    print(list.map((e) => e.title));
    return list;
  }
}
