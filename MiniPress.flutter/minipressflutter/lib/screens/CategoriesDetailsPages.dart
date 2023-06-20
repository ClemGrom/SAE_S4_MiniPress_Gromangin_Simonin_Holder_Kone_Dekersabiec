import 'package:flutter/material.dart';
import 'package:minipressflutter/models/categories.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Categories category;

  const CategoryDetailsPage({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.titre),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.titre,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16.0),
            Text(
              category.description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
