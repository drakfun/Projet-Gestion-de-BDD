<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
CREATE TABLE ANIME(
ID INT NOT NULL IDENTITY(1,1),
NOM VARCHAR(100) NOT NULL,
NOMBRE_EPISODE INT NOT NULL,
PRIMARY KEY(ID),

);
CREATE TABLE MANGA(
ID INT NOT NULL IDENTITY(1,1),
NOM VARCHAR(50),
DATE_PUBLICATION DATE NOT NULL ,
NOMBRE_TOME INT NOT NULL,
EDITION VARCHAR(50) NOT NULL ,
PRIMARY KEY(ID),
)

CREATE TABLE ADAPTATION(
ID INT NOT NULL IDENTITY(1,1),
ID_ANIME INT NOT NULL,
ID_STUDIO INT NOT NULL ,
PRIMARY KEY(ID),
)
CREATE TABLE AUTEUR(
ID INT NOT NULL IDENTITY(1,1),
PRENOM VARCHAR(100) NOT NULL ,
NOM VARCHAR(100) NOT NULL ,
DATE_NAISSANCE DATE NOT NULL,
PRIMARY KEY(ID),
);
CREATE TABLE CREATION (
ID INT NOT NULL IDENTITY(1,1),
ID_MANGA INT NOT NULL,
ID_AUTEUR INT NOT NULL ,
PRIMARY KEY(ID),
)

CREATE TABLE DIFFUSION(
ID INT NOT NULL IDENTITY(1,1),
NOMBRE_EPISODE INT ,
ANNEE_DEBUT DATE NOT NULL ,
ANNEE_FIN DATE ,
EN_COURS BIT ,
TERMINE BIT ,
PRIMARY KEY(ID),
);

CREATE TABLE STUDIO(
ID INT NOT NULL IDENTITY (1,1),
ANIMES_PRODUIT INT NOT NULL ,
ANNEE_CREATION DATE NOT NULL ,
PRIMARY KEY(ID),
);
CREATE TABLE PRODUCTION(
ID INT NOT NULL IDENTITY(1,1),
ID_ANIME INT NOT NULL ,
ID_STUDIO INT NOT NULL ,
PRIMARY KEY(ID),
)

CREATE TABLE LISTECATEGORIES(
ID INT NOT NULL IDENTITY(1,1),
NOM VARCHAR(50) NOT NULL ,
PRIMARY KEY(ID),
);
CREATE TABLE DOUBLEUR(
ID INT NOT NULL IDENTITY(1,1),
PRENOM VARCHAR(100) NOT NULL ,
NOM VARCHAR(100) NOT NULL,
DATE_NAISSANCE DATE NOT NULL,
PRIMARY KEY (ID),
);
CREATE TABLE DISPONIBILITE(
ID INT NOT NULL IDENTITY(1,1),
ID_DIFFUSION INT NOT NULL ,
STREAMING BIT NOT NULL,
BLURAY BIT NOT NULL,
CINEMA BIT NOT NULL,
TV BIT NOT NULL ,
)

CREATE TABLE POSSESSION(
ID INT NOT NULL IDENTITY(1,1),
ID_STUDIO INT NOT NULL,
ID_DIFFUSION INT NOT NULL,
PRIMARY KEY(ID),
)

CREATE TABLE CATEGORIES(
ID INT NOT NULL IDENTITY(1,1),
ANIME INT NOT NULL,
CATEGORIES INT NOT NULL ,
CONSTRAINT listecategorie_genre_fk FOREIGN KEY (GENRE) REFERENCES LISTEGENRE(ID),
CONSTRAINT c
PRIMARY KEY(ID),
)

CREATE TABLE PARTICIPATIONS (
ID INT NOT NULL IDENTITY(1,1),
ID_STUDIO INT NOT NULL ,
ID_DOUBLEUR INT NOT NULL,
PRIMARY KEY(ID),
)
CREATE TABLE SAISON (
<<<<<<< Updated upstream
ID_INT NOT NULL IDENTITY(1,1),
NOMBRE DE SAISON 
=======
ID INT NOT NULL IDENTITY(1,1),
NUM_SAISON INT NOT NULL (1,1),
NOMBRE_EPISODE INT NOT NULL (1,1),
PRIMARY KEY (ID),
)
CREATE TABLE EPISODE(
ID INT NOT NULL IDENTITY(1,1),
NUM_EPISODE INT NOT NULL,
ID_SAISON INT NOT NULL,
NOM VARCHAR(50) NOT NULL,
DUREE DECIMAL(2,2) NOT NULL,
PRIMARY KEY(ID),
CONSTRAINT episode_saison_fk FOREIGN KEY (ID_SAISON) REFERENCES SAISON(ID),
)
CREATE TABLE POSSEDE (
ID INT NOT NULL IDENTITY(1,1),
ID_SAISON INT NOT NULL ,
ID_ANIME INT NOT NULL ,
PRIMARY KEY(ID),
)

>>>>>>> Stashed changes

ALTER TABLE PARTICIPATIONS 
ADD CONSTRAINT participation_studio_fk FOREIGN KEY (ID_STUDIO) REFERENCES STUDIO(ID), CONSTRAINT participation_anime_fk FOREIGN KEY (ID_ANIME) REFERENCES ANIME(ID)

ALTER TABLE CREATION
ADD CONSTRAINT creation_manga_fk FOREIGN KEY (ID_MANGA) REFERENCES MANGA(ID),
 CONSTRAINT creation_auteur_fk FOREIGN KEY (ID_AUTEUR) REFERENCES AUTEUR(ID)

<<<<<<< Updated upstream


=======
>>>>>>> Stashed changes
ALTER TABLE DISPONIBILITE
ADD CONSTRAINT disponibilite_diffusion_fk FOREIGN KEY (ID_DIFFUSION) REFERENCES DIFFUSION(ID)

ALTER TABLE POSSESSION
ADD CONSTRAINT possession_studio_fk FOREIGN KEY(ID_STUDIO) REFERENCES STUDIO(ID),
 CONSTRAINT possession_diffusion_fk FOREIGN KEY(ID_DIFFUSION) REFERENCES DIFFUSION(ID)

ALTER TABLE PRODUCTION
ADD CONSTRAINT production_studio_fk FOREIGN KEY(ID_STUDIO) REFERENCES STUDIO(ID),
 CONSTRAINT production_anime_fk FOREIGN KEY(ID_ANIME) REFERENCES ANIME(ID)

ALTER TABLE ADAPTATION
ADD CONSTRAINT adaptation_manga_fk FOREIGN KEY(ID_MANGA) REFERENCES MANGA(ID),
CONSTRAINT adaptation_anime_fk FOREIGN KEY(ID_ANIME) REFERENCES ANIME(ID)