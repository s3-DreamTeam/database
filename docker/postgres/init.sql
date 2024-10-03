CREATE SCHEMA Projet;
set search_path = Projet;

CREATE TABLE status(
   status_id SERIAL,
   nom VARCHAR(50) ,
   PRIMARY KEY(status_id)
);

CREATE TABLE inventaire(
   inventaire_id SERIAL,
   PRIMARY KEY(inventaire_id)
);

CREATE TABLE produit(
   produit_id SERIAL,
   quantite INTEGER,
   prix_achat NUMERIC(15,2)  ,
   PRIMARY KEY(produit_id)
);

CREATE TABLE achat(
   achat_id SERIAL,
   achat_produit_id INTEGER,
   PRIMARY KEY(achat_id)
);

CREATE TABLE remplissage(
   remplissage_id SERIAL,
   PRIMARY KEY(remplissage_id)
);

CREATE TABLE type_de_machine(
   type_m_id SERIAL,
   model VARCHAR(50) ,
   manufacturier VARCHAR(50) ,
   no_serie VARCHAR(50) ,
   PRIMARY KEY(type_m_id)
);

CREATE TABLE dimension(
   dimension_id SERIAL,
   nom VARCHAR(50) ,
   largeur INTEGER,
   hauteur INTEGER,
   longueur INTEGER,
   forme VARCHAR(50) ,
   produit_par_unite INTEGER,
   est_emballe BOOLEAN,
   PRIMARY KEY(dimension_id)
);

CREATE TABLE type_de_caracteristique_produit(
   type_caracteristique_p_id SERIAL,
   nom VARCHAR(50) ,
   PRIMARY KEY(type_caracteristique_p_id)
);

CREATE TABLE type_de_caracteristique_machine(
   type_caracteristique_m_id SERIAL,
   nom VARCHAR(50) ,
   PRIMARY KEY(type_caracteristique_m_id)
);

CREATE TABLE usager(
   usager_id SERIAL,
   nom VARCHAR(50) ,
   prenom VARCHAR(50) ,
   solde INTEGER,
   email VARCHAR(50) ,
   profil_pic VARCHAR(50) ,
   status_id INTEGER NOT NULL,
   PRIMARY KEY(usager_id),
   FOREIGN KEY(status_id) REFERENCES status(status_id)
);

CREATE TABLE machine(
   machine_id SERIAL,
   emplacement VARCHAR(50) ,
   nom VARCHAR(50) ,
   type_m_id INTEGER NOT NULL,
   remplissage_id INTEGER NOT NULL,
   achat_id INTEGER NOT NULL,
   PRIMARY KEY(machine_id),
   FOREIGN KEY(type_m_id) REFERENCES type_de_machine(type_m_id),
   FOREIGN KEY(remplissage_id) REFERENCES remplissage(remplissage_id),
   FOREIGN KEY(achat_id) REFERENCES achat(achat_id)
);

CREATE TABLE type_de_produit(
   type_p_id SERIAL,
   nom VARCHAR(50) ,
   marge INTEGER,
   dimension_id INTEGER NOT NULL,
   PRIMARY KEY(type_p_id),
   FOREIGN KEY(dimension_id) REFERENCES dimension(dimension_id)
);

CREATE TABLE caracteristique_machine(
   caracteristique_m_id SERIAL,
   nom VARCHAR(50) ,
   description VARCHAR(50) ,
   type_caracteristique_m_id INTEGER NOT NULL,
   PRIMARY KEY(caracteristique_m_id),
   FOREIGN KEY(type_caracteristique_m_id) REFERENCES type_de_caracteristique_machine(type_caracteristique_m_id)
);

CREATE TABLE caracteristique_produit(
   caracteristique_p_id SERIAL,
   nom VARCHAR(50) ,
   type_caracteristique_p_id INTEGER NOT NULL,
   PRIMARY KEY(caracteristique_p_id),
   FOREIGN KEY(type_caracteristique_p_id) REFERENCES type_de_caracteristique_produit(type_caracteristique_p_id)
);

CREATE TABLE machine_x_inventaire(
   machine_id INTEGER,
   inventaire_id INTEGER,
   PRIMARY KEY(machine_id, inventaire_id),
   FOREIGN KEY(machine_id) REFERENCES machine(machine_id),
   FOREIGN KEY(inventaire_id) REFERENCES inventaire(inventaire_id)
);

CREATE TABLE inventaire_x_produit(
   inventaire_id INTEGER,
   produit_id INTEGER,
   PRIMARY KEY(inventaire_id, produit_id),
   FOREIGN KEY(inventaire_id) REFERENCES inventaire(inventaire_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id)
);

CREATE TABLE usager_x_achat(
   usager_id INTEGER,
   achat_id INTEGER,
   PRIMARY KEY(usager_id, achat_id),
   FOREIGN KEY(usager_id) REFERENCES usager(usager_id),
   FOREIGN KEY(achat_id) REFERENCES achat(achat_id)
);

CREATE TABLE usager_x_remplissage(
   usager_id INTEGER,
   remplissage_id INTEGER,
   PRIMARY KEY(usager_id, remplissage_id),
   FOREIGN KEY(usager_id) REFERENCES usager(usager_id),
   FOREIGN KEY(remplissage_id) REFERENCES remplissage(remplissage_id)
);

CREATE TABLE usager_x_machines(
   usager_id INTEGER,
   machine_id INTEGER,
   PRIMARY KEY(usager_id, machine_id),
   FOREIGN KEY(usager_id) REFERENCES usager(usager_id),
   FOREIGN KEY(machine_id) REFERENCES machine(machine_id)
);

CREATE TABLE remplissage_x_produit(
   produit_id INTEGER,
   remplissage_id INTEGER,
   PRIMARY KEY(produit_id, remplissage_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id),
   FOREIGN KEY(remplissage_id) REFERENCES remplissage(remplissage_id)
);

CREATE TABLE produit_x_type(
   produit_id INTEGER,
   type_p_id INTEGER,
   PRIMARY KEY(produit_id, type_p_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id),
   FOREIGN KEY(type_p_id) REFERENCES type_de_produit(type_p_id)
);

CREATE TABLE type_machine_x_caracteristique(
   type_m_id INTEGER,
   caracteristique_m_id INTEGER,
   PRIMARY KEY(type_m_id, caracteristique_m_id),
   FOREIGN KEY(type_m_id) REFERENCES type_de_machine(type_m_id),
   FOREIGN KEY(caracteristique_m_id) REFERENCES caracteristique_machine(caracteristique_m_id)
);

CREATE TABLE type_produit_x_caracteristique(
   type_p_id INTEGER,
   caracteristique_p_id INTEGER,
   PRIMARY KEY(type_p_id, caracteristique_p_id),
   FOREIGN KEY(type_p_id) REFERENCES type_de_produit(type_p_id),
   FOREIGN KEY(caracteristique_p_id) REFERENCES caracteristique_produit(caracteristique_p_id)
);


INSERT INTO projet.status (nom)
VALUES ('Client');
INSERT INTO projet.status (nom)
VALUES ( 'Gestionnaire');

INSERT INTO projet.type_de_caracteristique_machine (nom)
VALUES ('Type de machine 1');
INSERT INTO projet.type_de_caracteristique_machine (nom)
VALUES ('Type de machine 2');

INSERT INTO projet.type_de_caracteristique_produit (nom)
VALUES ('Type de produit 1');
INSERT INTO projet.type_de_caracteristique_produit (nom)
VALUES ('Type de produit 2');

INSERT INTO projet.caracteristique_machine (nom, description, type_caracteristique_m_id)
VALUES ('Caractéristique machine 1', 'Description 1', 1);

INSERT INTO projet.type_de_machine (model, manufacturier, no_serie)
VALUES ('Model 1', 'Manufacturier 1', 'No de série 1');

INSERT INTO projet.dimension (nom, largeur, hauteur, longueur, forme, produit_par_unite, est_emballe)
VALUES ('machine 1', 1, 1, 1, 'Forme 1', 1, TRUE);

INSERT INTO projet.type_de_produit (nom, marge, dimension_id)
VALUES ('Type de produit 1', 10, 1);

INSERT INTO projet.produit (quantite, prix_achat)
VALUES (1, 1);

INSERT INTO projet.inventaire (inventaire_id)
VALUES (1);

INSERT INTO projet.achat (achat_produit_id)
VALUES ('1');

INSERT INTO projet.remplissage (remplissage_id)
VALUES (1);

INSERT INTO projet.caracteristique_produit (nom, type_caracteristique_p_id)
VALUES ('Caractéristique produit 1', 1);

INSERT INTO projet.machine (emplacement, nom, type_m_id, remplissage_id, achat_id)
VALUES ('Emplacement 1', 'Nom 1', 1, 1, 1);

INSERT INTO projet.usager (nom, prenom, solde, email, profil_pic, status_id)
VALUES ('Nom 1', 'Prenom 1', 1, 'test', 'test', 1);
INSERT INTO projet.usager (nom, prenom, solde, email, profil_pic, status_id)
VALUES ('Nom 2', 'Prenom 2', 2, 'test', 'test', 2);



-- Création de Vue pour la comunication avec le backend

CREATE VIEW machine_usager AS
SELECT
    projet.machine.emplacement,
    projet.usager.nom
FROM
  projet.usager_x_machines
    JOIN projet.machine ON machine.machine_id = usager_x_machines.machine_id
    JOIN projet.usager ON usager.usager_id = usager_x_machines.usager_id;