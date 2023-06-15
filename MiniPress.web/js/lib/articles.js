import {load} from "./loader.js"
import {api_link} from "./api_links.js"

function getArticles() {
    return load(api_link+ "/articles")
}

function getArticlesById(id) {
    return load(api_link+ "/categories/" + id + "/articles")
}

function getArticleById(id) {
    return load(api_link+ "/articles/" + id)
}

async function affichage_articles(id) {
    let art;
    if(id == null) {
        art = await getArticles()
    }else{
        art = await getArticlesById(id)
    }
    let articles = document.getElementsByClassName("articles");

    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    art.articles.sort(function(a, b){
        return new Date(b.date) - new Date(a.date);
    });

    for(let i = 0; i < art.articles.length; i++){
        let div = document.createElement("div");
        div.classList.add("selectable");
        div.innerHTML = `<h1>${art.articles[i].titre}</h1> <p>Auteur : ${art.articles[i].auteur}</p>
            <p>Date de publication :  ${art.articles[i].date}</p>`
        articles[0].appendChild(div)
    }
    let selectable = document.getElementsByClassName("selectable");
    for(let i = 0; i < selectable.length; i++){
        selectable[i].addEventListener("click", function () {
            window.location.href = "lecture-article.html?id=" + art.articles[i].id
        })
    }
}

async function affichage_article(id) {
    let art = await getArticleById(id)

    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    console .log(art)
    let article = document.getElementsByClassName("article");
    let div = document.createElement("div");
    div.classList.add("anArticle");
    div.innerHTML = `<h1>${art.titre}</h1><br><p><b><U>Auteur :</U></b> ${art.auteur}</p>
            <p><b><U>Date de publication :</U></b>  ${art.date}</p><br><p><b><U>Resumé :</U></b> ${art.resume}</p><br><p>${art.contenu}</p>`
    article[0].appendChild(div)
}

export {affichage_articles, affichage_article}