CREATE SCHEMA Projet;
set search_path = Projet;

CREATE TABLE usager(
   id_usager VARCHAR(50) ,
   nom_usager VARCHAR(50) ,
   prenom_usager VARCHAR(50) ,
   solde_usager INTEGER,
   PRIMARY KEY(id_usager)
);

CREATE TABLE achat(
   id_achat SERIAL,
   produit_achat VARCHAR(50) ,
   PRIMARY KEY(id_achat)
);

CREATE TABLE type_de_machine(
   id_type_m SERIAL,
   model_type_m VARCHAR(50) ,
   manufacturier_type_m VARCHAR(50) ,
   image_type_m VARCHAR(20000) ,
   row_type_m INTEGER,
   column_type_m INTEGER,
   quantity_type_m INTEGER,
   id_usager VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_type_m),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager)
);

CREATE TABLE dimension(
   id_dimension SERIAL,
   nom_dimension VARCHAR(50) ,
   largeur_dimension INTEGER,
   hauteur_dimension INTEGER,
   longueur_dimension INTEGER,
   forme_dimension VARCHAR(50) ,
   produit_par_unite_dimension INTEGER,
   est_emballe_dimension BOOLEAN,
   PRIMARY KEY(id_dimension)
);

CREATE TABLE type_de_caracteristique_produit(
   id_type_caracteristique_p SERIAL,
   nom_type_caracteristique_p VARCHAR(50) ,
   PRIMARY KEY(id_type_caracteristique_p)
);

CREATE TABLE type_de_caracteristique_machine(
   id_type_caracteristique_m SERIAL,
   nom_type_caracteristique_m VARCHAR(50) ,
   PRIMARY KEY(id_type_caracteristique_m)
);

CREATE TABLE machine(
   id_machine SERIAL,
   emplacement_machine VARCHAR(50) ,
   nom_machine VARCHAR(50) ,
   image_machine VARCHAR(2000) ,
   no_serie VARCHAR(50) ,
   id_type_m INTEGER NOT NULL,
   id_usager VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_machine),
   FOREIGN KEY(id_type_m) REFERENCES type_de_machine(id_type_m),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager)
);

CREATE TABLE type_de_produit(
   id_type_p SERIAL,
   image_type_p VARCHAR(20000) ,
   nom_type_p VARCHAR(50) ,
   marge_type_p INTEGER,
   model_type_p VARCHAR(50) ,
   manufacturier_type_p VARCHAR(50) ,
   id_usager VARCHAR(50)  NOT NULL,
   id_dimension INTEGER NOT NULL,
   PRIMARY KEY(id_type_p),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_dimension) REFERENCES dimension(id_dimension)
);

CREATE TABLE caracteristique_machine(
   id_caracteristique_m SERIAL,
   nom_caracteristique_m VARCHAR(50) ,
   description_caracteristique_m VARCHAR(50) ,
   type_caracteristique_m VARCHAR(50) ,
   id_type_caracteristique_m INTEGER NOT NULL,
   PRIMARY KEY(id_caracteristique_m),
   FOREIGN KEY(id_type_caracteristique_m) REFERENCES type_de_caracteristique_machine(id_type_caracteristique_m)
);

CREATE TABLE caracteristique_produit(
   id_caracteristique_p SERIAL,
   nom_caracteristique_p VARCHAR(50) ,
   id_type_caracteristique_p INTEGER NOT NULL,
   PRIMARY KEY(id_caracteristique_p),
   FOREIGN KEY(id_type_caracteristique_p) REFERENCES type_de_caracteristique_produit(id_type_caracteristique_p)
);

CREATE TABLE produit(
   id_produit SERIAL,
   quantite_produit INTEGER,
   prix_achat_produit INTEGER,
   image_produit VARCHAR(20000) ,
   nom_produit VARCHAR(50) ,
   id_usager VARCHAR(50)  NOT NULL,
   id_type_p INTEGER NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_type_p) REFERENCES type_de_produit(id_type_p)
);

CREATE TABLE inventaire(
   id_inventaire SERIAL,
   slot_inventaire VARCHAR(50) ,
   quantite_inventaire INTEGER,
   id_produit INTEGER NOT NULL,
   id_machine INTEGER NOT NULL,
   PRIMARY KEY(id_inventaire),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit),
   FOREIGN KEY(id_machine) REFERENCES machine(id_machine)
);

CREATE TABLE usager_x_achat(
   id_usager VARCHAR(50) ,
   id_achat INTEGER,
   PRIMARY KEY(id_usager, id_achat),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_achat) REFERENCES achat(id_achat)
);

CREATE TABLE achat_x_produit(
   id_machine INTEGER,
   id_achat INTEGER,
   PRIMARY KEY(id_machine, id_achat),
   FOREIGN KEY(id_machine) REFERENCES machine(id_machine),
   FOREIGN KEY(id_achat) REFERENCES achat(id_achat)
);

CREATE TABLE type_machine_x_caracteristique(
   id_type_m INTEGER,
   id_caracteristique_m INTEGER,
   PRIMARY KEY(id_type_m, id_caracteristique_m),
   FOREIGN KEY(id_type_m) REFERENCES type_de_machine(id_type_m),
   FOREIGN KEY(id_caracteristique_m) REFERENCES caracteristique_machine(id_caracteristique_m)
);

CREATE TABLE type_produit_x_caracterisitque(
   id_type_p INTEGER,
   id_caracteristique_p INTEGER,
   PRIMARY KEY(id_type_p, id_caracteristique_p),
   FOREIGN KEY(id_type_p) REFERENCES type_de_produit(id_type_p),
   FOREIGN KEY(id_caracteristique_p) REFERENCES caracteristique_produit(id_caracteristique_p)
);


-- Insertion de données dans la base de données
INSERT INTO projet.usager (id_usager)
VALUES
    ('rama2001'),
    ('gasb3002'),
    ('pald2501'),
    ('chab1704'),
    ('rene1902'),
    ('saua5384'),
    ('beab1802'),
    ('garn1201'),
    ('maif1401'),
    ('mons2007'),
    ('brij0701'),
    ('gaue1909'),
    ('tchj1603'),
    ('cotr1509'),
    ('belv1805'),
    ('legm1303'),
    ('ricr1604'),
    ('lafa2013'),
    ('meda4684'),
    ('larv1803'),
    ('latq4202'),
    ('boua2511'),
    ('lanc0902'),
    ('graf2102'),
    ('camz1901'),
    ('stlm1906'),
    ('frae2001'),
    ('roya1619'),
    ('seil7357'),
    ('rerm1001'),
    ('goux1801'),
    ('labb1405'),
    ('gaud1401'),
    ('rodz1401'),
    ('cars1804'),
    ('laus1801'),
    ('boua1424'),
    ('lall2411'),
    ('cous1912'),
    ('more2101'),
    ('pouc1302'),
    ('farg2101'),
    ('lesj0901'),
    ('stel2002'),
    ('default');


INSERT INTO projet.type_de_produit (image_type_p, nom_type_p, marge_type_p, model_type_p, manufacturier_type_p, id_usager, id_dimension)
VALUES ('image', 'type 1',1, 'model', 'manufacturier', 'default', 1);

INSERT INTO projet.produit (quantite_produit, prix_achat_produit, image_produit, nom_produit, id_usager, id_type_p)
VALUES (1, 1, 'image', 'Nom produit 1', 'default', 1);

