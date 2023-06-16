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

// Export
export {getAuteur}