import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../data/store/home_store.dart';
import '../domain/entities/article.dart';
import 'components/card_article.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (context) {
            final favList = context.read<HomeStore>().favoritesList;
            return ListView.builder(
              itemCount: favList.length,
              itemBuilder: (context, index) {
                final Article article = favList[index];
                return CardArticle(
                  article: article,
                  isFavorite: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
