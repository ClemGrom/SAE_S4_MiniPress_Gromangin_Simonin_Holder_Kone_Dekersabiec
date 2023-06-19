import 'package:flutter/material.dart';
import 'package:minipressflutter/models/categories.dart';
import 'package:minipressflutter/screens/HomePage.dart';
import 'package:minipressflutter/screens/CategoriesPage.dart';

class MiniPress extends StatefulWidget {
  const MiniPress({ Key? key }) : super(key: key);

  @override
  _MiniPressState createState() => _MiniPressState();
}

class _MiniPressState extends State<MiniPress> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('MiniPress')),
        ),
        
        body: const CategoriesPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}