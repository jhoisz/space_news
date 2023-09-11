// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:space_news/data/store/home_store.dart';

import '../../domain/entities/article.dart';
import '../../utils/themes/theme.dart';
import '../details.dart';

class CardArticle extends StatefulWidget {
  const CardArticle({
    Key? key,
    required this.article,
    required this.isFavorite,
  }) : super(key: key);

  final Article article;
  final bool isFavorite;

  @override
  State<CardArticle> createState() => _CardArticleState();
}

class _CardArticleState extends State<CardArticle> {
  @override
  Widget build(BuildContext context) {
    final HomeStore homeStore = context.read<HomeStore>();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                article: widget.article,
                isFavorite: widget.isFavorite,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                image: NetworkImage(widget.article.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMMEEEEd().format(
                            DateTime.parse(widget.article.updatedAt),
                          ),
                          style: ArticleDecoration.dateStyle,
                        ),
                        Text(
                          widget.article.title,
                          style: ArticleDecoration.titleStyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        isSelected: widget.isFavorite,
                        icon: const Icon(Icons.favorite_border),
                        selectedIcon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if (widget.isFavorite) {
                            homeStore.removeFavorite(widget.article);
                          } else {
                            homeStore.setFavorite(widget.article);
                          }
                        },
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.share),
                        onPressed: () async {
                          await Share.share(widget.article.url);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
