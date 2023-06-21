/*
 * Fonction load qui charge des informations depuis notre API
 * @param url l'url de l'API
 * @return les données
 */
function load(url) {
    // On retourne une promesse avec les données
    return fetch(url)
        // On convertit les données en JSON
        .then(response => response.json())
        // On retourne les données
        .then(data => {
            return data
        })
        // On affiche l'erreur dans la console en cas d'erreur
        .catch(error => console.log(error))
}

// Export
export {load}