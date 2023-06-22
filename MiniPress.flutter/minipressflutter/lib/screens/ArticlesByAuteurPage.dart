import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';

/*
 * Page d'affichage des articles par auteur
 */
class ArticlesByAuteurPage extends StatefulWidget {
  // Auteur des articles à afficher
  final String author;

  // Constructeur de la classe
  const ArticlesByAuteurPage({Key? key, required this.author})
      : super(key: key);

  // Méthode qui permet de créer l'état de la classe
  @override
  _ArticlesByAuteurPageState createState() => _ArticlesByAuteurPageState();
}

/*
 * Classe qui permet de créer l'état de la classe ArticlesByAuteurPage
 */
class _ArticlesByAuteurPageState extends State<ArticlesByAuteurPage> {
  // futureArticle : liste des articles à afficher
  late Future<List<Articles>> futureArticle;

  // Méthode qui permet de créer l'état de la classe
  @override
  void initState() {
    super.initState();
    // Récupération des articles à afficher
    futureArticle = fetchArticlesByAuthor(widget.author);
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
          title: const Text('Articles par auteur'),
        ),
        // Affichage des articles
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
