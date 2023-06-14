
-- Création de la table ARTICLE
CREATE TABLE IF NOT EXISTS ARTICLE (
    id INT(8) PRIMARY KEY,
    titre VARCHAR(50),
    resume VARCHAR(500) NULL,
    contenu TEXT,
    date_crea DATE
);

-- Création de la table CATEGORIE
CREATE TABLE IF NOT EXISTS CATEGORIE (
    id INT(4) PRIMARY KEY,
    titre VARCHAR(50),
    description TEXT
);

-- Création de la table UTILISATEUR
CREATE TABLE IF NOT EXISTS UTILISATEUR (
    id INT(11) PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(128),
    passwd_hash VARCHAR(256),
    activation_token VARCHAR(128),
    activation_expires TIMESTAMP,
    renew_token VARCHAR(128),
    renew_expires TIMESTAMP,
    user_status INT(3),
    FOREIGN KEY (user_status) REFERENCES USER_STATUS(id)
);

-- Création de la table USER_STATUS
CREATE TABLE IF NOT EXISTS USER_STATUS (
    id INT(3) PRIMARY KEY,
    libelle VARCHAR(50)
);

-- Création de la table IMAGE
CREATE TABLE IF NOT EXISTS IMAGE (
    id INT(11) PRIMARY KEY,
    categ_id INT(4),
    author_id INT(11),
    FOREIGN KEY (categ_id) REFERENCES CATEGORIE(id),
    FOREIGN KEY (author_id) REFERENCES UTILISATEUR(id)
);
