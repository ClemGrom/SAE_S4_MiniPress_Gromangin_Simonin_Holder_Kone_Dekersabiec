import {api_links} from "./api.js";

function loadArticle(id) {
    const url = api_links + "/articles/" + id;
    return fetch(url)
        .then(response => response.json())
        .then(data => {
            return data;
        })
        .catch(error => console.log(error));
}

function loadAllArticles() {
    const url = api_links + "/articles";
    return fetch(url)
        .then(response => response.json())
        .then(data => {
            return data;
        })
        .catch(error => console.log(error));
}

export { loadArticle, loadAllArticles };