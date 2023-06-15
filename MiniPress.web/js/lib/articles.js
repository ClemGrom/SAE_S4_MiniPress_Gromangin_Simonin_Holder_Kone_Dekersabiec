import {load} from "./loader.js"
import {api_link} from "./api_links.js"

function getArticles() {
    return load(api_link+ "/articles")
}

async function affichage_articles() {
    let art = await getArticles()
    let articles = document.getElementsByClassName("articles");
    for(let i = 0; i < art.articles.length; i++){
        let div = document.createElement("div");
        div.classList.add("article");
        div.innerHTML = `<h1>${art.articles[i].titre}</h1> <p>Auteur : ${art.articles[i].auteur}</p>
            <p>Date de publication :  ${art.articles[i].date}</p>`
        articles[0].appendChild(div)
    }
    console.log(art.articles)
}

export {affichage_articles}