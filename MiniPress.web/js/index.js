// Import
import {affichage_categories} from "./lib/categories_ui.js";
import {affichage_articles, affichage_article} from "./lib/articles_ui.js";

/*
 * Evènement qui se déclenche quand la page est chargée
 */
document.addEventListener("DOMContentLoaded", event =>{
    // On récupère l'url
    let location = window.location.href

    // On récupère les paramètres de l'url
    let url = new URL(window.location.href);
    let id = url.searchParams.get("id");
    let mot = url.searchParams.get("mot")
    let sort = url.searchParams.get("sort");
    let auteur = url.searchParams.get("author");

    // On affiche les éléments en fonction de l'url
    if(location.includes("categories.html")){
        // On affiche les catégories si on est sur la page des catégories
        affichage_categories();
    }else if(location.includes("articles.html")) {
        // On affiche les articles si on est sur la page des articles
        affichage_articles(id, mot, sort, auteur);
    }else if (location.includes("lecture-article.html")) {
        // On affiche l'article si on est sur la page de l'article
        affichage_article(id);
    }

    // On ajoute un évènement sur le bouton de recherche
    document.addEventListener("keydown", function (e) {
        // Si on appuie sur entrée on lance la recherche
        if(e.key == "Enter") {
            // On récupère la valeur de la recherche
            let search = document.querySelector('.search input');
            // Si la recherche n'est pas vide
            if(search.value != "") {
                // On redirige vers la page des articles avec le mot à chercher
                window.location.href = "articles.html?mot=" + search.value
            }
        }
    })

})