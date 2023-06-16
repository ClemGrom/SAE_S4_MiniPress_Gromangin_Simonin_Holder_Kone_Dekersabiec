// Import
import {getCategories} from "./categories.js";

/*
 * Fonction qui affiche toutes les catégories
 */
async function affichage_categories() {
    // On récupère les catégories
    let cat = await getCategories()
    let categories = document.getElementsByClassName("categories");

    // On retire l'icone de chargement
    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    // Pour chaque catégorie on crée un div avec les informations
    for (let i = 0; i < cat.categories.length; i++) {
        let div = document.createElement("div");
        div.classList.add("selectable");
        div.innerHTML = `<h1>${cat.categories[i].titre}</h1> <p>${cat.categories[i].description}</p>`
        categories[0].appendChild(div)
    }
    // On ajoute un évènement sur chaque catégorie pour rediriger vers la page de la catégorie
    let selectable = document.getElementsByClassName("selectable");
    for (let i = 0; i < selectable.length; i++) {
        selectable[i].addEventListener("click", function () {
            window.location.href = "articles.html?id=" + cat.categories[i].id
        })
    }
}

// Export
export {affichage_categories}
