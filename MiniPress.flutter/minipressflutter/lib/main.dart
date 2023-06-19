import 'package:flutter/material.dart';
import 'models/categories.dart';

void main() => runApp(const MiniPress());

class MiniPress extends StatefulWidget {
  const MiniPress({Key? key}) : super(key: key);

  @override
  State<MiniPress> createState() => _MyAppState();
}

class _MyAppState extends State<MiniPress> {
  late Future<List<Categories>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniPress',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MiniPress'),
        ),
        body: Center(
          child: FutureBuilder<List<Categories>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final category = snapshot.data![index];
                    return ListTile(
                      title: Text(
                        'Catégorie : ' +
                            category.titre +
                            '\n' +
                            category.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
