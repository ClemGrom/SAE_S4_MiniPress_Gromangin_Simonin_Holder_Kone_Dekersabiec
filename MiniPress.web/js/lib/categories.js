import {load} from "./loader.js"
import {api_link} from "./api_links.js"

function getCategories() {
    return load(api_link+ "/categories")
}

async function affichage_categories() {
    let cat = await getCategories()
    let categories = document.getElementsByClassName("categories");
    for (let i = 0; i < cat.categories.length; i++) {
        let div = document.createElement("div");
        div.classList.add("categorie");
        div.innerHTML = `<h1>${cat.categories[i].titre}</h1> <p>${cat.categories[i].description}</p>`
        categories[0].appendChild(div)
    }
}

export {affichage_categories}