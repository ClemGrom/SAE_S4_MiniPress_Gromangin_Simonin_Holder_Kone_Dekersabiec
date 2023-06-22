import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:markdown/markdown.dart';

/*
 * Classe articles 
 */
class Articles {
  /*
   * Attributs de la classe
   * id : id de l'article
   * titre : titre de l'article
   * resume : resume de l'article
   * contenu : contenu de l'article
   * date_crea : date de creation de l'article
   * categ_id : id de la categorie de l'article
   * author : auteur de l'article
   */
  final String id;
  final String titre;
  final String resume;
  final String contenu;
  final String date_crea;
  final int categ_id;
  final String author;
  final String url;

  /*
   * Constructeur de la classe
   * initialisation des attributs
   */
  const Articles(
      {required this.id,
      required this.titre,
      required this.resume,
      required this.contenu,
      required this.date_crea,
      required this.categ_id,
      required this.author,
      required this.url});

  /*
   * Fonction de conversion d'un json en objet Articles
   * json : json a convertir
   * return : objet Articles
   */
  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'] as String,
      titre: json['titre'] as String,
      resume: json['resume'] as String,
      contenu: json['contenu'] as String,
      date_crea: json['date'] as String,
      categ_id: json['categorie'] as int,
      author: json['auteur'] as String,
      url: json['url'] as String,
    );
  }
}

/*
 * Lien de l'api
 */
const String api_links = "http://docketu.iutnc.univ-lorraine.fr:20003/api/";

/*
 * Fonction de chargement des articles
 * @param links : lien de l'api
 * @return : liste d'articles en fonction du lien
 */
Future<List<Articles>> loadArticles(String links) async {
  // chargement des articles en fonction du lien
  final response = await http.get(Uri.parse(links));

  // si le chargement est reussi
  if (response.statusCode == 200) {
    // recuperation des donnees json et conversion en map
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> res = [];
    // pour chaque article on recupere les donnees de l'auteur
    for (int i = 0; i < data['articles'].length; i++) {
      // si l'auteur est null on le remplace par inconnu
      if (data['articles'][i]['auteur'] == null) {
        data['articles'][i]['auteur'] = "Inconnu";
        // sinon on recupere les donnees de l'auteur
      } else {
        // recuperation des donnees json et conversion en map
        final auteurInfo = await http.get(Uri.parse(
            api_links + 'auteurs/' + data['articles'][i]['auteur'].toString()));
        // recuperation des donnees json et conversion en map
        final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
        data['articles'][i]['auteur'] = dataAutor['auteur'];
      }

      // initialisation des donnees manquantes a vide
      data['articles'][i]['resume'] = "";
      data['articles'][i]['contenu'] = "";
      data['articles'][i]['categorie'] = 0;
      data['articles'][i]['url'] = "";

      // ajout de l'article a la liste
      res.add(data['articles'][i]);
    }
    // conversion de la liste en liste d'articles
    return res.map((json) => Articles.fromJson(json)).toList();
    // si le chargement echoue
  } else {
    throw Exception('Failed to load Articles');
  }
}

/*
 * Fonction qui permet de charger tous les articles
 * @return : liste d'articles
 */
Future<List<Articles>> fetchArticles() async {
  return loadArticles(api_links + 'articles?sort=date-asc');
}

/*
 * Fonction qui permet de charger les articles d'une categorie
 * @param categID : id de la categorie
 * @return : liste d'articles de la categorie
 */
Future<List<Articles>> fetchArticlesByCategories(String categID) async {
  return loadArticles(api_links + 'categories/' + categID + '/articles');
}

/*
 * Fonction qui permet de charger les articles d'une recherche
 * @param word : mot a rechercher
 * @return : liste d'articles qui contiennent le mot dans leur titre ou leur resume
 */
Future<List<Articles>> fetchArticlesBySearch(String word) async {
  List<Articles> articles =
      await loadArticles(api_links + 'articles?sort=date-asc');
  List<Articles> res = [];
  // pour chaque article on verifie si le mot est dans le titre ou le resume
  for (int i = 0; i < articles.length; i++) {
    if (articles[i].titre.contains(word) || articles[i].resume.contains(word)) {
      res.add(articles[i]);
    }
  }
  return res;
}

/*
 * Fonction qui permet de charger les articles d'un auteur
 * @param authorName : nom de l'auteur
 * @return : liste d'articles de l'auteur
 */
Future<List<Articles>> fetchArticlesByAuthor(String authorName) async {
  List<Articles> articles =
      await loadArticles(api_links + 'articles?sort=date-asc');
  List<Articles> res = [];
  // pour chaque article on verifie si l'auteur est le bon
  for (int i = 0; i < articles.length; i++) {
    if (articles[i].author == authorName) {
      res.add(articles[i]);
    }
  }
  return res;
}

/*
 * Fonction qui permet de charger les articles par ordre de date de creation
 * @return : liste d'articles par ordre de date de creation
 */
Future<List<Articles>> fetchArticlesByOrderDateCreaAsc() async {
  return loadArticles(api_links + 'articles?sort=date-asc');
}

/*
 * Fonction qui permet de charger les articles par ordre de date de creation inverse
 * @return : liste d'articles par ordre de date de creation inverse
 */
Future<List<Articles>> fetchArticlesByOrderDateCreaDesc() async {
  return loadArticles(api_links + 'articles?sort=date-desc');
}

/*
 * Fonction qui permet de charger un article par son id
 * @param id : id de l'article
 * @return : article
 */
Future<Articles> fetchArticleByID(String id) async {
  // chargement de l'article en fonction de son id
  final response = await http.get(Uri.parse(api_links + 'articles/' + id));

  // si le chargement est reussi
  if (response.statusCode == 200) {
    // recuperation des donnees json et conversion en map
    final Map<String, dynamic> data = jsonDecode(response.body);
    // si l'auteur est null on le remplace par inconnu
    if (data['auteur'] == null) {
      data['auteur'] = "Inconnu";
      // sinon on recupere les donnees de l'auteur
    } else {
      // recuperation des donnees json et conversion en map
      final auteurInfo = await http
          .get(Uri.parse(api_links + 'auteurs/' + data['auteur'].toString()));
      // recuperation des donnees json et conversion en map
      final Map<String, dynamic> dataAutor = jsonDecode(auteurInfo.body);
      data['auteur'] = dataAutor['auteur'];
    }

    // passage du contenu de l'article de markdown a html
    data['contenu'] = markdownToHtml(data['contenu']);

    final image =
        await http.get(Uri.parse(api_links + 'articles/' + id + '/images'));
    final Map<String, dynamic> dataImage = jsonDecode(image.body);
    final url = dataImage['images'][0]['url'];
    data['url'] = 'assets/img/' + url;

    return Articles.fromJson(data);
    // si le chargement echoue
  } else {
    throw Exception('Failed to load Article');
  }
}

// Future<String> imageLink(String id) async {
//   final image =
//       await http.get(Uri.parse(api_links + 'articles/' + id + '/images'));
//   final Map<String, dynamic> dataImage = jsonDecode(image.body);
//   final url = dataImage['images'][0]['url'];
//   return 'assets/img/' + url;
// }
