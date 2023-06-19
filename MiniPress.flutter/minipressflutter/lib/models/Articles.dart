import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

Future<Articles> fetchArticles() async {
  final response =
      await http.get(Uri.parse('http://localhost:20003/api/articles'));

  if (response.statusCode == 200) {
    return Articles.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load articles');
  }
}

class Articles {
  final int id;
  final String titre;
  final String resume;
  final Text contenu;
  final DateTime date_crea;
  final int categorie_id;
  final int author_id;

  const Articles(
      {required this.id,
      required this.titre,
      required this.resume,
      required this.contenu,
      required this.date_crea,
      required this.categorie_id,
      required this.author_id});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'] as int,
      titre: json['titre'] as String,
      resume: json['resume'] as String,
      contenu: json['contenu'] as Text,
      date_crea: json['date_crea'] as DateTime,
      categorie_id: json['categorie_id'] as int,
      author_id: json['author_id'] as int,
    );
  }
}
