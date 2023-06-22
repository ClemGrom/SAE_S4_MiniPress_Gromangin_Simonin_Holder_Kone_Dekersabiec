import 'package:http/http.dart' as http;
import 'dart:convert';

/*
 * Classe categories
 */
class Categories {
  /*
   * Attributs de la classe categories
   * id : id de la categorie
   * titre : titre de la categorie
   * description : description de la categorie
   */
  final String id;
  final String titre;
  final String description;

  /*
   * Constructeur de la classe
   * initialisation des attributs
   */
  const Categories({
    required this.id,
    required this.titre,
    required this.description,
  });

  /*
   * Fonction de conversion d'un json en objet Categories
   * json : json a convertir
   * return : objet Categories
   */
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String,
    );
  }
}

/*
 * Methode de recuperation des categories
 * return : liste des categories
 */
Future<List<Categories>> fetchCategories() async {
  // recuperation des categories
  final response = await http.get(
      Uri.parse('http://docketu.iutnc.univ-lorraine.fr:20003/api/categories'));

  // si le code de la reponse est 200
  if (response.statusCode == 200) {
    // recuperation des donnees json et conversion en map
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    // recuperation des donnees categories
    final List<dynamic> categoriesData = jsonData['categories'];
    // conversion des donnees en liste d'objets Categories
    return categoriesData.map((json) => Categories.fromJson(json)).toList();
    // si le code de la reponse est different de 200
  } else {
    throw Exception('Failed to load Categories');
  }
}
