import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:flutter_html/flutter_html.dart';

/*
 * Page d'affichage d'un article en détail après avoir cliqué dessus
 */
class ArticleDetailPage extends StatefulWidget {
  // L'article à afficher
  final Articles article;

  // Constructeur
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  // Méthode qui permet de créer l'état de la classe
  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

/*
 * Classe qui permet de créer l'état de la classe ArticleDetailPage
 */
class _ArticleDetailPageState extends State<ArticleDetailPage> {
  // futureArticle : article à afficher
  late Future<Articles> futureArticle;

  // late Future<String> futurImg;

  // Méthode qui permet de créer l'état de la classe
  @override
  void initState() {
    super.initState();
    // Récupération de l'article à afficher
    futureArticle = fetchArticleByID(widget.article.id.toString());
    // futurImg = imageLink(widget.article.id.toString());
  }

  // Méthode qui permet de créer l'affichage de la classe
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Article',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Article'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: FutureBuilder<Articles>(
                future: futureArticle,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Affichage de l'article
                    return Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10.0)),
                        Text(
                          snapshot.data!.titre,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 40),
                        ),
                        Text(
                          snapshot.data!.date_crea +
                              "  -  " +
                              snapshot.data!.author,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data!.resume,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Html(data: snapshot.data!.contenu),
                        Image.asset(snapshot.data!.url)
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              ),
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
        ));
  }
}
