class article {
  int? id;
  String titre;
  String resume;
  String contenu;
  String date;
  String cat_id;

  article({
    this.id = 0,
    this.titre = "",
    this.resume = "",
    this.contenu = "",
    this.date = "",
    this.cat_id = "",
  });

  final truc =
      http.get(Uri.parse('https://minipress.herokuapp.com/api/articles'));
}
