import {affichage_categories} from "./lib/categories.js";
import {affichage_articles, affichage_article} from "./lib/articles.js";

let location = window.location.href

let url = new URL(window.location.href);
let id = url.searchParams.get("id");

if(location.includes("categories.html")){
    affichage_categories();
}else if(location.includes("articles.html")) {
    affichage_articles(id);
}else if (location.includes("lecture-article.html")) {
    affichage_article(id);
}