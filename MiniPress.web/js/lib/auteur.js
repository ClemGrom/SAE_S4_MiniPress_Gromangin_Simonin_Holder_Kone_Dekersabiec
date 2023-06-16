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
    return load(api_link+ "/auteurs/" + id + "/articles")
}

// Export
export {getAuteur, getArticlesByAuteur}