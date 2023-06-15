import {affichage_categories} from "./lib/categories.js";
import {affichage_articles} from "./lib/articles.js";

let location = window.location.href

if(location.includes("categories.html")){
    affichage_categories();
}else if(location.includes("articles.html")) {
    affichage_articles();
}
