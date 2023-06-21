import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';
import 'package:minipressflutter/screens/ArticlesSearchPage.dart';
import 'package:minipressflutter/screens/ArticlesByAuteurPage.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late Future<List<Articles>> futureArticles;
  late List<Articles> articlesList;
  bool isReversed = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticles();
  }

  Future<List<Articles>> fetchArticles() async {
    List<Articles> articles = await fetchArticlesByOrderDate_Crea();
    if (isReversed) {
      articles = articles.reversed.toList();
    }
    articlesList = articles;
    return articles;
  }

  Future<List<Articles>> fetchArticlesByOrderDate_Crea() async {
    final response = await http.get(
      Uri.parse('http://docketu.iutnc.univ-lorraine.fr:20003/api/articles'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> res = [];

      for (int i = 0; i < data['articles'].length; i++) {
        if (data['articles'][i]['auteur'] == null) {
          data['articles'][i]['auteur'] = "Inconnu";
        } else {
          final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
                data['articles'][i]['auteur'].toString(),
          ));
          final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
          data['articles'][i]['auteur'] = dataAutor['auteur'];
        }

        data['articles'][i]['resume'] = "";
        data['articles'][i]['contenu'] = "";
        data['articles'][i]['categorie'] = 0;

        res.add(data['articles'][i]);
      }
      return res.map((json) => Articles.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Articles');
    }
  }

  void changeOrder() {
    setState(() {
      isReversed = !isReversed;
      futureArticles = fetchArticles();
    });
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
                          search: _searchController.text.toString(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: changeOrder,
            ),
          ],
        ),
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
                          trailing: IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticlesByAuteurPage(
                                    author: article.author,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
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
