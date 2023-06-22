import 'package:flutter/material.dart';
import 'package:minipressflutter/models/Articles.dart';
import 'package:minipressflutter/models/categories.dart';
import 'package:minipressflutter/screens/ArticleAffichage.dart';

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
    return ArticleAffichagePage(articles: futureArticles);
  }
}
