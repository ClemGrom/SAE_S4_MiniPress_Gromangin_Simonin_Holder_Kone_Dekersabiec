import {load} from "./loader.js"
import {api_link} from "./api_links.js"

function getCategories() {
    return load(api_link+ "/categories")
}

export {getCategories}