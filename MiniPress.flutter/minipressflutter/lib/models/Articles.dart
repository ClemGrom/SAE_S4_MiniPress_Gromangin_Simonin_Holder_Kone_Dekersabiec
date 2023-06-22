import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;

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

const String api_links = "http://docketu.iutnc.univ-lorraine.fr:20003/api/";

Future<List<Articles>> loadArticles(String links) async {
  final response = await http.get(Uri.parse(links));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            api_links + 'auteurs/' + data['articles'][i]['auteur'].toString()));
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

Future<List<Articles>> fetchArticles() async {
  return loadArticles(api_links + 'articles?sort=date-asc');
}

Future<List<Articles>> fetchArticlesByCategories(String categID) async {
  return loadArticles(api_links + 'categories/' + categID + '/articles');
}

Future<List<Articles>> fetchArticlesBySearch(String word) async {
  List<Articles> articles =
      await loadArticles(api_links + 'articles?sort=date-asc');
  List<Articles> res = [];
  for (int i = 0; i < articles.length; i++) {
    if (articles[i].titre.contains(word) || articles[i].resume.contains(word)) {
      res.add(articles[i]);
    }
  }
  return res;
}

Future<List<Articles>> fetchArticlesByAuthor(String authorName) async {
  List<Articles> articles =
      await loadArticles(api_links + 'articles?sort=date-asc');
  List<Articles> res = [];
  for (int i = 0; i < articles.length; i++) {
    if (articles[i].author == authorName) {
      res.add(articles[i]);
    }
  }
  return res;
}

Future<List<Articles>> fetchArticlesByOrderDateCreaAsc() async {
  return loadArticles(api_links + 'articles?sort=date-asc');
}

Future<List<Articles>> fetchArticlesByOrderDateCreaDesc() async {
  return loadArticles(api_links + 'articles?sort=date-desc');
}

Future<Articles> fetchArticleByID(String id) async {
  final response = await http.get(Uri.parse(api_links + 'articles/' + id));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data['auteur'] == null) {
      data['auteur'] = "Inconnu";
    } else {
      final auteurInfo = await http
          .get(Uri.parse(api_links + 'auteurs/' + data['auteur'].toString()));
      final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
      data['auteur'] = dataAutor['auteur'];
    }

    data['contenu'] = markdownToHtml(data['contenu']);

    return Articles.fromJson(data);
  } else {
    throw Exception('Failed to load Article');
  }
}
