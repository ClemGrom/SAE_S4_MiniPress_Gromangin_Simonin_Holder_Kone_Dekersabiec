import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

Future<Categories> fetchCategories() async {
  final response =
      await http.get(Uri.parse('http://localhost:20003/api/categories'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Categories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Categories');
  }
}

class Categories {
  final String id;
  final String titre;
  final String description;

  const Categories(
      {required this.id, required this.titre, required this.description});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] as String,
      titre: json['titre'] as String,
      description: json['description'] as String,
    );
  }
}
