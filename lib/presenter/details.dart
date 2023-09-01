import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/entities/article.dart';
import '../theme.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.article});
  final Article article;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool standardSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Article'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    flexibleSpace: Image(
                      image: NetworkImage(widget.article.imageUrl),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    collapsedHeight: MediaQuery.of(context).size.height * 0.1,
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    actions: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: IconButton(
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
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Align(
                                alignment: AlignmentDirectional.center,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.article.title,
                              style: ArticleDetailDecoration.titleStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 32.0,
                              ),
                              child: Text(
                                DateFormat.yMMMMEEEEd().format(
                                  DateTime.parse(widget.article.updatedAt),
                                ),
                                style: ArticleDetailDecoration.dateStyle,
                              ),
                            ),
                            Text(
                              widget.article.summary,
                              style: ArticleDetailDecoration.textStyle,
                            ),
                          ],
                        ),
                      ),
                    ]),
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