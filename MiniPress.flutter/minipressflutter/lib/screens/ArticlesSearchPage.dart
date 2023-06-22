import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleAffichage.dart';

/* ArticlesSearchPage
*param : search : String
*return : _ArticlesSearchPageState */
class ArticlesSearchPage extends StatefulWidget {
  final String search;
  const ArticlesSearchPage({Key? key, required this.search}) : super(key: key);

  @override
  _ArticlesSearchPageState createState() => _ArticlesSearchPageState();
}

/* _ArticlesSearchPageState
*param : futureArticles : Future<List<Articles>>
*return : ArticleAffichagePage */
class _ArticlesSearchPageState extends State<ArticlesSearchPage> {
  late Future<List<Articles>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticlesBySearch(widget.search);
  }

  @override
  Widget build(BuildContext context) {
    return ArticleAffichagePage(articles: futureArticles);
  }
}
