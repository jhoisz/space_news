import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/article.dart';
import '../../theme.dart';

class CardArticle extends StatefulWidget {
  const CardArticle({super.key, required this.article});
  final Article article;

  @override
  State<CardArticle> createState() => _CardArticleState();
}

class _CardArticleState extends State<CardArticle> {
  bool standardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 6
            ),
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
                      isSelected: standardSelected,
                      icon: const Icon(Icons.favorite_border),
                      selectedIcon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          standardSelected = !standardSelected;
                        });
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
