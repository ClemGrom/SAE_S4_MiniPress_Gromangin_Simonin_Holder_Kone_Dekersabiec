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
  final String author;

  const Articles(
      {required this.id,
      required this.titre,
      required this.resume,
      required this.contenu,
      required this.date_crea,
      required this.categ_id,
      required this.author});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'] as String,
      titre: json['titre'] as String,
      resume: json['resume'] as String,
      contenu: json['contenu'] as String,
      date_crea: json['date'] as String,
      categ_id: json['categorie'] as int,
      author: json['auteur'] as String,
    );
  }
}

Future<List<Articles>> fetchArticles() async {
  final response =
      await http.get(Uri.parse('http://localhost:20003/api/articles'));

  if (response.statusCode == 200) {
    // final Map<String, dynamic> jsonData = jsonDecode(response.body);
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      // final articleInfo = await http.get(Uri.parse(
      //     'http://localhost:20003/api' + jsonData['articles'][i]['href']));
      // final Map<String, dynamic> data = jsonDecode(articleInfo.body);
      print(data['articles'][i]['auteur']);
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://localhost:20003/api/auteurs/' +
                data['articles'][i]['auteur'].toString()));
        final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
        data['articles'][i]['auteur'] = dataAutor['auteur'];
      }

      data['articles'][i]['resume'] = "";
      data['articles'][i]['contenu'] = "";
      data['articles'][i]['categorie'] = 0;

      res.add(data['articles'][i]);
    }
    return res.map((json) => Articles.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Articles');
  }
}
