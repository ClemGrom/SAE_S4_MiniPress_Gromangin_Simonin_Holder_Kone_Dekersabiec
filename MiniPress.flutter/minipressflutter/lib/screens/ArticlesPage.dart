import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';
import 'package:minipressflutter/screens/ArticlesSearchPage.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Articles>> futureArticles;

  final TextEditingController _searchController = TextEditingController();

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
            title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Rechercher un article',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () => _searchController.clear(),
              ),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticlesSearchPage(
                          search: _searchController.text.toString()),
                    ),
                  );
                },
              ),
            ),
          ),
        )),
        body: Center(
          child: FutureBuilder<List<Articles>>(
            future: futureArticles,
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
