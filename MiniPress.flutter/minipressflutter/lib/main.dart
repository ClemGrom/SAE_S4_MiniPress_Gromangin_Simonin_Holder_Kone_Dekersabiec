import 'package:flutter/material.dart';
import 'models/categories.dart';

void main() => runApp(const MiniPress());

class MiniPress extends StatefulWidget {
  const MiniPress({super.key});

  @override
  State<MiniPress> createState() => _MyAppState();
}

class _MyAppState extends State<MiniPress> {
  late Future<Categories> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Categories>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.titre);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
