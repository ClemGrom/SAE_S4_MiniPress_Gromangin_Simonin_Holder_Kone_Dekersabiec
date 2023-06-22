import 'package:flutter/material.dart';
import 'package:minipressflutter/screens/ArticlesPage.dart';
import 'package:minipressflutter/screens/CategoriesPage.dart';

//* MiniPress
//* Classe qui permet de gérer les onglets de l'application

class MiniPress extends StatefulWidget {
  const MiniPress({super.key});

  @override
  State<MiniPress> createState() => _MiniPressState();
}

/* _MiniPressState
*param : _currentIndex : int
*param : _tabs : List<Widget>
*return : MaterialApp */

class _MiniPressState extends State<MiniPress> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    CategoriesPage(),
    ArticlesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //initialisation de l'application
        title: 'MiniPress',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _tabs[_currentIndex],
          //création d'une barre de navigation
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            //actions des boutons de la barre de navigation
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              //création des boutons de la barre de navigation
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'Articles',
              ),
            ],
          ),
        ));
  }
}
