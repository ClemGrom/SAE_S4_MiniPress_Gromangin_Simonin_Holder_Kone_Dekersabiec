import 'package:flutter/material.dart';

class MiniPress extends StatefulWidget {
  const MiniPress({Key? key}) : super(key: key);

  @override
  _MiniPressState createState() => _MiniPressState();
}

class _MiniPressState extends State<MiniPress> {
  int _currentIndex = 0; // Indice de l'onglet actuellement sélectionné

  final List<Widget> _tabs = [
    // Contenu des différents onglets
    HomePage(),
    NewsPage(),
    UserPage(),
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
              icon: Icon(Icons.article),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Utilisateur',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'News Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'User Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
