import {affichage_categories} from "./lib/categories.js";
import {affichage_articles, affichage_article} from "./lib/articles.js";

document.addEventListener("DOMContentLoaded", event =>{

    let location = window.location.href

    let url = new URL(window.location.href);
    let id = url.searchParams.get("id");
    let mot = url.searchParams.get("mot")
    let sort = url.searchParams.get("sort");

    if(location.includes("categories.html")){
        affichage_categories();
    }else if(location.includes("articles.html")) {
        affichage_articles(id, mot, sort);
    }else if (location.includes("lecture-article.html")) {
        affichage_article(id);
    }

    document.addEventListener("keydown", function (e) {
        if(e.key == "Enter") {
            let search = document.querySelector('.search input');
            if(search.value != "") {
                window.location.href = "articles.html?mot=" + search.value
            }
        }
    })

})