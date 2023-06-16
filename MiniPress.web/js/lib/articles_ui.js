// Import
import{getArticles, getArticlesById, getArticlesByMot, getArticlesSort, getArticleById} from "./articles.js";
import {getAuteur} from "./auteur.js";

/*
 * Fonction qui affiche tous les articles
 * @param id l'id de la catégorie si il y en a un
 * @param mot le mot à chercher si il y en a un
 * @param sort le type de tri si il y en a un
 */
async function affichage_articles(id, mot, sort) {
    let art;
    // On récupère les articles
    if(mot != null){
        art = await getArticlesByMot(mot)
    }if(sort != null){
        art = await getArticlesSort(sort)
    }else if(id == null) {
        art = await getArticles()
    }else {
        art = await getArticlesById(id)
    }
    let articles = document.getElementsByClassName("articles");

    // On retire l'icone de chargement
    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    // Pour chaque article on crée un div avec les informations
    for(let i = 0; i < art.articles.length; i++){
        // Chargement de l'auteur
        let auteur = "Inconnu"
        if(art.articles[i].auteur != null) {
            auteur = await getAuteur(art.articles[i].auteur)
            auteur = auteur.auteur
        }

        let div = document.createElement("div");
        div.classList.add("selectable");
        div.innerHTML = `<h1>${art.articles[i].titre}</h1> <p>Auteur : ${auteur}</p>
            <p>Date de publication :  ${art.articles[i].date}</p>`
        articles[0].appendChild(div)
    }

    // Si il n'y a pas d'article on affiche un message d'erreur
    if(art.articles.length == 0){
        let div = document.createElement("div");
        div.classList.add("selectable");
        div.innerHTML = `<h1>Aucun article trouvé</h1>`
        articles[0].appendChild(div)
    }

    // On ajoute un évènement sur chaque article pour rediriger vers la page de l'article
    let selectable = document.getElementsByClassName("selectable");
    for(let i = 0; i < selectable.length; i++){
        selectable[i].addEventListener("click", function () {
            window.location.href = "lecture-article.html?id=" + art.articles[i].id
        })
    }
}

/*
 * Fonction qui affiche un article en entier
 * @param id l'id de l'article
 */
async function affichage_article(id) {
    // On récupère l'article
    let art = await getArticleById(id)

    // On retire l'icone de chargement
    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    // On récupère l'auteur
    let auteur = "Inconnu"
    if(art.auteur != null) {
        auteur = await getAuteur(art.auteur)
        auteur = auteur.auteur
    }

    // On crée un div avec les informations de l'article
    let article = document.getElementsByClassName("article");
    let div = document.createElement("div");
    div.classList.add("anArticle");
    div.innerHTML = `<h1>${art.titre}</h1><br><p><b><U>Auteur :</U></b> ${auteur}</p>
            <p><b><U>Date de publication :</U></b>  ${art.date}</p><br><p><b><U>Resumé :</U></b> ${art.resume}</p><br><p>${art.contenu}</p>`
    article[0].appendChild(div)
}

// Export
export {affichage_articles, affichage_article}