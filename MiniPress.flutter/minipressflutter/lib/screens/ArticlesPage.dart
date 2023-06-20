import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Articles>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
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
            child: Scaffold(
          body: FutureBuilder<List<Articles>>(
            future: futureArticles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return ListView.builder(
                //   itemCount: snapshot.data!.length,
                //   itemBuilder: (context, index) {
                //     final article = snapshot.data![index];
                //     return ListTile(
                //       title: Text(
                //         article.titre +
                //             '\n' +
                //             article.date_crea +
                //             "  -  " +
                //             article.author,
                //         style: const TextStyle(
                //           fontSize: 16.0,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.pink,
                //         ),
                //       ),
                //     );
                //   },
                // );
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final article = snapshot.data![index];
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailPage(article: article),
                          ),
                        );
                      },
                      child: Text(
                        article.titre +
                            '\n' +
                            article.date_crea +
                            "  -  " +
                            article.author,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        )),
      ),
    );
  }
}
