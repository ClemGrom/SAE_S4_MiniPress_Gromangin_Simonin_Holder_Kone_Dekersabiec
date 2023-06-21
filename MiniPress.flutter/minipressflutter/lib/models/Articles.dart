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
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/articles?sort=date-asc'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
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

Future<List<Articles>> fetchArticlesByCategories(String categID) async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/categories/' +
          categID +
          '/articles'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    print(data['articles']);
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
                data['articles'][i]['auteur'].toString()));
        final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
        data['articles'][i]['auteur'] = dataAutor['auteur'];
      }

      data['articles'][i]['resume'] = "";
      data['articles'][i]['contenu'] = "";
      data['articles'][i]['categorie'] = 0;
      print(data['articles'][i]);
      res.add(data['articles'][i]);
    }
    print("end");
    return res.map((json) => Articles.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Articles');
  }
}

Future<Articles> fetchArticleByID(String id) async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/articles/' + id));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data['auteur'] == null) {
      data['auteur'] = "Inconnu";
    } else {
      final auteurInfo = await http.get(Uri.parse(
          'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
              data['auteur'].toString()));
      final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
      data['auteur'] = dataAutor['auteur'];
    }

    return Articles.fromJson(data);
  } else {
    throw Exception('Failed to load Article');
  }
}

Future<List<Articles>> fetchArticlesBySearch(String word) async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/articles?sort=date-asc'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
                data['articles'][i]['auteur'].toString()));
        final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
        data['articles'][i]['auteur'] = dataAutor['auteur'];
      }

      data['articles'][i]['resume'] = "";
      data['articles'][i]['contenu'] = "";
      data['articles'][i]['categorie'] = 0;

      // ajouter que si le mot est dans le titre ou le resume
      if (data['articles'][i]['titre'].toString().contains(word) ||
          data['articles'][i]['resume'].toString().contains(word)) {
        res.add(data['articles'][i]);
      }
    }
    return res.map((json) => Articles.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Articles');
  }
}

Future<List<Articles>> fetchArticlesByAuthor(String authorName) async {
  final response = await http.get(
    Uri.parse('http://docketu.iutnc.univ-lorraine.fr:20003/api/articles'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];

    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
          'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
              data['articles'][i]['auteur'].toString(),
        ));
        final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
        data['articles'][i]['auteur'] = dataAutor['auteur'];
      }

      data['articles'][i]['resume'] = "";
      data['articles'][i]['contenu'] = "";
      data['articles'][i]['categorie'] = 0;

      if (data['articles'][i]['auteur'] == authorName) {
        res.add(data['articles'][i]);
      }
    }
    return res.map((json) => Articles.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Articles');
  }
}

Future<List<Articles>> fetchArticlesByOrderDateCreaAsc() async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/articles?sort=date-asc'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
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

Future<List<Articles>> fetchArticlesByOrderDateCreaDesc() async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:20003/api/articles?sort=date-desc'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    for (int i = 0; i < data['articles'].length; i++) {
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
      } else {
        final auteurInfo = await http.get(Uri.parse(
            'http://docketu.iutnc.univ-lorraine.fr:20003/api/auteurs/' +
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
