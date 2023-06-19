import 'package:flutter/material.dart';
import 'package:minipressflutter/screens/ArticlesPage.dart';
import 'package:minipressflutter/screens/CategoriesPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Bienvenue sur la page d\'accueil de MiniPress',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16.0),
          Text(
            'Visialisez les articles ou les catégories',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
