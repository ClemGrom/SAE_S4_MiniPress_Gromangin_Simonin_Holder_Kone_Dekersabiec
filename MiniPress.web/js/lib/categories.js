import {load} from "./loader.js"
import {api_link} from "./api_links.js"

function getCategories() {
    return load(api_link+ "/categories")
}

async function affichage_categories() {
    let cat = await getCategories()
    let categories = document.getElementsByClassName("categories");

    let loadingIcon = document.getElementById('loading-icon');
    loadingIcon.style.display = 'none';

    for (let i = 0; i < cat.categories.length; i++) {
        let div = document.createElement("div");
        div.classList.add("selectable");
        div.innerHTML = `<h1>${cat.categories[i].titre}</h1> <p>${cat.categories[i].description}</p>`
        categories[0].appendChild(div)
    }
    let selectable = document.getElementsByClassName("selectable");
    for (let i = 0; i < selectable.length; i++) {
        selectable[i].addEventListener("click", function () {
            window.location.href = "articles.html?id=" + cat.categories[i].id
        })
    }
}

export {affichage_categories}