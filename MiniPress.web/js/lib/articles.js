// import
import {load} from "./loader.js"
import {api_link} from "./api_links.js"

/*
 * Fonction qui récupère tous les articles
 * @return les articles dans l'ordre décroissant de publication
 */
function getArticles() {
    return load(api_link+ "/articles?sort=date-desc")
}

/*
 * Fonction qui récupère tous les articles d'une catégorie par son id
 * @param id l'id de la catégorie
 * @return les articles
 */
function getArticlesById(id) {
    return load(api_link+ "/categories/" + id + "/articles")
}

/*
 * Fonction qui récupère un article par son id
 * @param id l'id de l'article
 * @return l'article
 */
function getArticleById(id) {
    return load(api_link+ "/articles/" + id)
}

/*
 * Fonction qui récupère tous les articles qui contiennent un mot dans leur titre ou leur résumé
 * @param mot le mot à chercher
 * @return les articles
 * /!\ Cette fonction est très lente car elle doit récupérer tous les articles puis les parcourir
 */
async function getArticlesByMot(mot) {
    // On récupère tous les articles
    let art = await getArticles()
    let articles = {articles: []}
    // On parcourt tous les articles
    for(let i = 0; i < art.articles.length; i++){
        // On récupère l'article par son id
        let article = await getArticleById(art.articles[i].id)
        // On vérifie si le mot est dans le titre ou le résumé
        if(article.resume.toLowerCase().includes(mot.toLowerCase())
            || art.articles[i].titre.toLowerCase().includes(mot.toLowerCase())){
            articles.articles.push(art.articles[i])
        }
    }
    // On retire les paramètres de l'url
    window.history.pushState({}, document.title, "/html/" + "articles.html");
    return articles
}

/*
 * Fonction qui récupère tous les articles triés par date par ordre croissant ou décroissant
 * @param sort le type de tri
 * @return les articles
 */
async function getArticlesSort(sort) {
    // On retire les paramètres de l'url
    window.history.pushState({}, document.title, "/html/" + "articles.html");
    return load(api_link + "/articles?sort=date-" + sort)
}

// Exportation des fonctions
export {getArticles, getArticlesById, getArticleById, getArticlesByMot, getArticlesSort}