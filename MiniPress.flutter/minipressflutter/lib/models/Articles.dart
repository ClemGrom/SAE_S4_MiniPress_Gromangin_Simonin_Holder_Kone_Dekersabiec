import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class Articles {
  final String id;
  final String titre;
  final String resume;
  final String contenu;
  final String date_crea;
  final int categ_id;
  final int author_id;

  const Articles(
      {required this.id,
      required this.titre,
      required this.resume,
      required this.contenu,
      required this.date_crea,
      required this.categ_id,
      required this.author_id});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'] as String,
      titre: json['titre'] as String,
      resume: json['resume'] as String,
      contenu: json['contenu'] as String,
      date_crea: json['date'] as String,
      categ_id: json['categorie'] as int,
      author_id: json['auteur'] as int,
    );
  }
}

Future<List<Articles>> fetchArticles() async {
  final response =
      await http.get(Uri.parse('http://localhost:20003/api/articles'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final List<dynamic> articlesData = jsonData['articles'];
    List<dynamic> res = [];
    for (int i = 0; i < jsonData['articles'].length; i++) {
      final articleInfo = await http.get(Uri.parse(
          'http://localhost:20003/api' + jsonData['articles'][i]['href']));
      final Map<String, dynamic> data = jsonDecode(articleInfo.body);
      if (data['auteur'] == null) {
        data['auteur'] = 0;
      }
      res.add(data);
    }
    return res.map((json) => Articles.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Articles');
  }
}
