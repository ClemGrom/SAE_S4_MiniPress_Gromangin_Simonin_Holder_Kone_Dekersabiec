import 'package:flutter/material.dart';
import 'package:minipressflutter/screens/ArticlesPage.dart';
import 'package:minipressflutter/screens/CategoriesPage.dart';

class MiniPress extends StatefulWidget {
  const MiniPress({super.key});

  @override
  State<MiniPress> createState() => _MiniPressState();
}

class _MiniPressState extends State<MiniPress> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    CategoriesPage(),
    ArticlesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MiniPress',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
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
