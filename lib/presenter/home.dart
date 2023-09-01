import 'package:flutter/material.dart';

import '../data/api/api.dart';
import 'components/card_article.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Space News'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
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
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return CardArticle(article: snapshot.data![index]);
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                  break;
                case ConnectionState.none:
                  return const Center(
                    child: Text('Erro'),
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
