import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../data/api/api.dart';
import '../data/store/home_store.dart';
import '../domain/entities/article.dart';
import 'components/card_article.dart';
import 'favorites.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    final HomeStore homeStore = context.read<HomeStore>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Space News'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favorites(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: api.getArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                    final articles = snapshot.data!;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final Article article = articles[index];
                        return Observer(
                          builder: (_) {
                            final favList = homeStore.favoritesList;
                            return CardArticle(
                              article: article,
                              isFavorite: favList.any(
                                (element) => element.id == article.id,
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  break;
                case ConnectionState.none:
                  return const Center(
                    child: Text('Error loading articles'),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
