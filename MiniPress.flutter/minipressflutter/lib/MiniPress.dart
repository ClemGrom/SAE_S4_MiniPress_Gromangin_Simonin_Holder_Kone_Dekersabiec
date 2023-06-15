import 'package:flutter/material.dart';
import '../screens/CategoriesPage.dart';
import '../screens/HomePage.dart';
import '../screens/ComptePage.dart';

class MiniPress extends StatefulWidget {
  const MiniPress({Key? key}) : super(key: key);

  @override
  _MiniPressState createState() => _MiniPressState();
}

class _MiniPressState extends State<MiniPress> {
  int _currentIndex = 0; // Indice de l'onglet actuellement sélectionné

  final List<Widget> _tabs = [
    // Contenu des différents onglets
    const HomePage(),
    // const CategoriesPage(),
    const ComptePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniPress',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MiniPress'),
        ),
        body:
            _tabs[_currentIndex], // Affiche le contenu de l'onglet sélectionné

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            // Met à jour l'indice de l'onglet sélectionné
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Articles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Compte',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MiniPress());
}
