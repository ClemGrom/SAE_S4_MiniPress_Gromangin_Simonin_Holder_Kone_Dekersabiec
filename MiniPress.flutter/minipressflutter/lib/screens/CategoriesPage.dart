import 'package:flutter/material.dart';
import 'package:minipressflutter/models/categories.dart';
import 'CategoriesDetailsPages.dart';

/* CategoriesPage 
*param : key : Key
*return : _CategoriesPageState */
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

/* _CategoriesPageState
*param : futureCategories : Future<List<Categories>>
*return : MaterialApp */
class _CategoriesPageState extends State<CategoriesPage> {
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Categorie'),
        ),
        //création d'une liste de catégories
        body: Center(
          child: FutureBuilder<List<Categories>>(
            future: futureCategories,
            builder: (context, snapshot) {
              //affiche la liste des catégories
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final category = snapshot.data![index];
                    return Card(
                        child: ListTile(
                      title: Text(category.titre, textAlign: TextAlign.center),
                      //action au clic sur une catégorie
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryDetailsPage(category: category),
                            ),
                          );
                        });
                      },
                    ));
                  },
                );
                //message d'erreur si la liste des catégories est vide
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
