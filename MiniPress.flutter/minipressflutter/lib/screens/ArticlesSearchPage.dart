import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/screens/ArticleAffichage.dart';
import 'package:minipressflutter/screens/ArticleDetails.dart';

class ArticlesSearchPage extends StatefulWidget {
  final String search;
  const ArticlesSearchPage({Key? key, required this.search}) : super(key: key);

  @override
  _ArticlesSearchPageState createState() => _ArticlesSearchPageState();
}

class _ArticlesSearchPageState extends State<ArticlesSearchPage> {
  late Future<List<Articles>> futureArticles;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureArticles = fetchArticlesBySearch(widget.search);
  }

  @override
  Widget build(BuildContext context) {
    print(futureArticles == [null]);
    return ArticleAffichagePage(articles: futureArticles);
  }
}
