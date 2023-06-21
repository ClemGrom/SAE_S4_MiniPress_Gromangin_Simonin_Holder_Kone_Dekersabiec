// Import
import {load} from "./loader.js"
import {api_link} from "./api_links.js"

/*
 * Fonction qui récupère toutes les catégories
 * @return les catégories
 */
function getCategories() {
    return load(api_link+ "/categories")
}

// Export
export {getCategories}