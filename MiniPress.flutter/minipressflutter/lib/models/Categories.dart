import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories {
  final String id;
  final String titre;
  final String description;

  const Categories({
    required this.id,
    required this.titre,
    required this.description,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String,
    );
  }
}

Future<List<Categories>> fetchCategories() async {
  final response =
      await http.get(Uri.parse('http://localhost:20003/api/categories'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final List<dynamic> categoriesData = jsonData['categories'];
    return categoriesData.map((json) => Categories.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Categories');
  }
}
