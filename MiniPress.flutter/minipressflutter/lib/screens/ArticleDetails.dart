import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';

class ArticleDetailPage extends StatefulWidget {
  final Articles article;
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late Future<Articles> futureArticle;

  @override
  void initState() {
    super.initState();
    futureArticle = fetchArticleByID(widget.article.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniPress',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MiniPress'),
        ),
        body: Center(
          child: FutureBuilder<Articles>(
            future: futureArticle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // aficher le contenu de l'article
                return Text(snapshot.data!.titre +
                    '\n' +
                    snapshot.data!.date_crea +
                    "  -  " +
                    snapshot.data!.author +
                    '\n' +
                    snapshot.data!.resume +
                    '\n' +
                    snapshot.data!.contenu);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
