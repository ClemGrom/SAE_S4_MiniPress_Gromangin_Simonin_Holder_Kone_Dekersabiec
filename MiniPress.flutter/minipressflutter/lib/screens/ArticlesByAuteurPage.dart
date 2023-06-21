import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';

class ArticlesByAuteurPage extends StatefulWidget {
  final String author;

  const ArticlesByAuteurPage({Key? key, required this.author})
      : super(key: key);

  @override
  _ArticlesByAuteurPageState createState() => _ArticlesByAuteurPageState();
}

class _ArticlesByAuteurPageState extends State<ArticlesByAuteurPage> {
  late Future<List<Articles>> futureArticle;
  @override
  void initState() {
    super.initState();
    futureArticle = fetchArticlesByAuthor(widget.author);
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
          title: const Text('Articles par auteur'),
        ),
        body: Center(
          child: FutureBuilder<List<Articles>>(
            future: futureArticle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final article = snapshot.data![index];
                    return Card(
                        child: ListTile(
                      title: Text(article.titre),
                      subtitle: Text(
                        article.date_crea + "  -  " + article.author,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetailPage(article: article),
                            ),
                          );
                        });
                      },
                    ));
                  },
                ));
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
