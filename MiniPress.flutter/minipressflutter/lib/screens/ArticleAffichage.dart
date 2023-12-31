import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';
import 'package:minipressflutter/screens/ArticlesSearchPage.dart';
import 'package:minipressflutter/screens/ArticlesByAuteurPage.dart';

/* 
 * Classe qui permet de retourner un affichage pour une liste d'article
 */
class ArticleAffichagePage extends StatefulWidget {
  // Liste d'article à afficher
  final Future<List<Articles>> articles;

  // Constructeur
  const ArticleAffichagePage({Key? key, required this.articles})
      : super(key: key);

  // Méthode qui permet de créer l'état de la classe
  @override
  _ArticleAffichagePageState createState() => _ArticleAffichagePageState();
}

/*
 * Classe qui permet de créer l'état de la classe ArticleAffichagePage
 */
class _ArticleAffichagePageState extends State<ArticleAffichagePage> {
  // Contrôleur de la zone de recherche
  final TextEditingController _searchController = TextEditingController();

  // Méthode qui permet de créer l'affichage de la classe
  @override
  Widget build(BuildContext context) {
    // Retourne un affichage
    return MaterialApp(
      title: 'MiniPress',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Barre de recherche
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
        ),
        // Affichage des articles
        body: Center(
          child: FutureBuilder<List<Articles>>(
            future: widget.articles,
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
        // Barre de navigation
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
