import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';
import 'package:minipressflutter/screens/ArticlesSearchPage.dart';
import 'package:minipressflutter/screens/ArticlesByAuteurPage.dart';

/*
  * Classe qui permet de retourner un affichage pour la liste de tous les articles
  */
class ArticlesPage extends StatefulWidget {
  // Constructeur
  const ArticlesPage({Key? key}) : super(key: key);

  // Méthode qui permet de créer l'état de la classe
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

/*
 * Classe qui permet de créer l'état de la classe ArticlesPage
 */
class _ArticlesPageState extends State<ArticlesPage> {
  // futureArticles : liste des articles à afficher
  late Future<List<Articles>> futureArticles;
  // articlesList : liste des articles à afficher
  late List<Articles> articlesList;
  // isReversed : booléen qui permet de savoir si la liste est inversée ou non
  bool isReversed = false;

  // Méthode qui permet de créer l'état de la classe
  final TextEditingController _searchController = TextEditingController();

  // Méthode qui permet de créer l'état de la classe
  @override
  void initState() {
    super.initState();
    // Récupération des articles à afficher
    futureArticles = fetchArticles();
  }

  // Méthode qui permet de récupérer la liste des articles
  Future<List<Articles>> fetchArticles() async {
    // Récupération de la liste des articles
    List<Articles> articles = await fetchArticlesByOrderDateCreaDesc();
    // Inversion de la liste si besoin
    if (isReversed) {
      articles = articles.reversed.toList();
    }
    articlesList = articles;
    return articles;
  }

  // Méthode qui permet de changer l'ordre d'affichage des articles
  void changeOrder() {
    setState(() {
      isReversed = !isReversed;
      futureArticles = fetchArticles();
    });
  }

  // Méthode qui permet de créer l'affichage de la classe
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniPress',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Barre de recherche
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
        // Affichage des articles
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
