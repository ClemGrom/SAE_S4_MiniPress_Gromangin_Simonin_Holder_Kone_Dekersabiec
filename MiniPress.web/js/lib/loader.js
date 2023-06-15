import {api_link} from "./api_links.js"

function load(url) {
    return fetch(url)
        .then(response => response.json())
        .then(data => {
            return data
        })
        .catch(error => console.log(error))
}

export {load}