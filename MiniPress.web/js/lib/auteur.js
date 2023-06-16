// Import
import {load} from "./loader.js"
import {api_link} from "./api_links.js"

/*
 * Fonction qui récupère un auteur par son id
 * @param id l'id de l'auteur
 * @return l'auteur
 */
function getAuteur(id) {
    return load(api_link+ "/auteurs/" + id)
}

/*
 * Fonction qui récupère tous les articles d'un auteur par son id
 * @param id l'id de l'auteur
 * @return les articles
 */
function getArticlesByAuteur(id) {
    // On retire les paramètres de l'url
    window.history.pushState({}, document.title, "/html/" + "articles.html");
    // Si l'id n'est pas null
    if(id != "null"){
        // On récupère les articles de l'auteur
        return load(api_link+ "/auteurs/" + id + "/articles")
    }else {
        // Sinon on retourne un tableau vide
        return {articles: []}
    }
}

// Export
export {getAuteur, getArticlesByAuteur}