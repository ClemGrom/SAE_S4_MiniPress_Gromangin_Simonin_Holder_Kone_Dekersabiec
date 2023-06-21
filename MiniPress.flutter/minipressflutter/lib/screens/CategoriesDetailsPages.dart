import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/models/categories.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';

class CategoryDetailsPage extends StatefulWidget {
  final Categories category;
  const CategoryDetailsPage({Key? key, required this.category})
      : super(key: key);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  late Future<List<Articles>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticlesByCategories(widget.category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.category.titre,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.category.titre),
        ),
        body: Center(
          child: FutureBuilder<List<Articles>>(
            future: futureArticles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
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
                );
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
