CREATE SCHEMA Projet;
set search_path = Projet;

CREATE TABLE usager(
   id_usager VARCHAR(50) ,
   nom_usager VARCHAR(50) ,
   prenom_usager VARCHAR(50) ,
   solde_usager INTEGER,
   PRIMARY KEY(id_usager)
);

CREATE TABLE inventaire(
   id_inventaire SERIAL,
   PRIMARY KEY(id_inventaire)
);

CREATE TABLE achat(
   id_achat SERIAL,
   produit_achat VARCHAR(50) ,
   PRIMARY KEY(id_achat)
);

CREATE TABLE remplissage(
   id_remplissage SERIAL,
   PRIMARY KEY(id_remplissage)
);

CREATE TABLE type_de_machine(
   id_type_m SERIAL,
   model_type_m VARCHAR(50) ,
   manufacturier_type_m VARCHAR(50) ,
   no_serie_type_m VARCHAR(50) ,
   image_type_m VARCHAR(50) ,
   PRIMARY KEY(id_type_m)
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
   image_machine VARCHAR(50) ,
   id_type_m INTEGER NOT NULL,
   id_remplissage INTEGER NOT NULL,
   PRIMARY KEY(id_machine),
   FOREIGN KEY(id_type_m) REFERENCES type_de_machine(id_type_m),
   FOREIGN KEY(id_remplissage) REFERENCES remplissage(id_remplissage)
);

CREATE TABLE type_de_produit(
   id_type_p SERIAL,
   image_type_p VARCHAR(50) ,
   nom_type_p VARCHAR(50) ,
   marge_type_p INTEGER,
   model_type_p VARCHAR(50) ,
   manufacturier_type_p VARCHAR(50) ,
   id_dimension INTEGER NOT NULL,
   PRIMARY KEY(id_type_p),
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
   image_produit VARCHAR(50) ,
   nom_produit VARCHAR(50) ,
   id_type_p INTEGER NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_type_p) REFERENCES type_de_produit(id_type_p)
);

CREATE TABLE machine_x_inventaire(
   id_machine INTEGER,
   id_inventaire INTEGER,
   PRIMARY KEY(id_machine, id_inventaire),
   FOREIGN KEY(id_machine) REFERENCES machine(id_machine),
   FOREIGN KEY(id_inventaire) REFERENCES inventaire(id_inventaire)
);

CREATE TABLE inventaire_x_produit(
   id_inventaire INTEGER,
   id_produit INTEGER,
   PRIMARY KEY(id_inventaire, id_produit),
   FOREIGN KEY(id_inventaire) REFERENCES inventaire(id_inventaire),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit)
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

CREATE TABLE usager_x_remplissage(
   id_usager VARCHAR(50) ,
   id_remplissage INTEGER,
   PRIMARY KEY(id_usager, id_remplissage),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_remplissage) REFERENCES remplissage(id_remplissage)
);

CREATE TABLE usager_x_machines(
   id_usager VARCHAR(50) ,
   id_machine INTEGER,
   PRIMARY KEY(id_usager, id_machine),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_machine) REFERENCES machine(id_machine)
);

CREATE TABLE remplissage_x_produit(
   id_produit INTEGER,
   id_remplissage INTEGER,
   PRIMARY KEY(id_produit, id_remplissage),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit),
   FOREIGN KEY(id_remplissage) REFERENCES remplissage(id_remplissage)
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

CREATE TABLE usager_x_produit(
   id_usager VARCHAR(50) ,
   id_produit INTEGER,
   PRIMARY KEY(id_usager, id_produit),
   FOREIGN KEY(id_usager) REFERENCES usager(id_usager),
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit)
);


-- Insertion de données dans la base de données

INSERT INTO projet.type_de_caracteristique_machine (nom_type_caracteristique_m)
VALUES ('Type de machine 1');
INSERT INTO projet.type_de_caracteristique_machine (nom_type_caracteristique_m)
VALUES ('Type de machine 2');

INSERT INTO projet.type_de_caracteristique_produit (nom_type_caracteristique_p)
VALUES ('Type de produit 1');
INSERT INTO projet.type_de_caracteristique_produit (nom_type_caracteristique_p)
VALUES ('Type de produit 2');

INSERT INTO projet.caracteristique_machine (nom_caracteristique_m, description_caracteristique_m, type_caracteristique_m, id_type_caracteristique_m)
VALUES ('Caractéristique machine 1', 'Description 1', 1, 1);

INSERT INTO projet.type_de_machine (model_type_m, manufacturier_type_m, no_serie_type_m, image_type_m)
VALUES ('Model 1', 'Manufacturier 1', 'No de série 1', 'image');

INSERT INTO projet.dimension (nom_dimension, largeur_dimension, hauteur_dimension, longueur_dimension, forme_dimension, produit_par_unite_dimension, est_emballe_dimension)
VALUES ('machine 1', 1, 1, 1, 'Forme 1', 1, TRUE);

INSERT INTO projet.type_de_produit (image_type_p, nom_type_p, marge_type_p, id_dimension, model_type_p, manufacturier_type_p)
VALUES ('image', 'type 1', 1, 1, 'model', 'manufacturier');

INSERT INTO projet.produit (quantite_produit, prix_achat_produit, image_produit, nom_produit, id_type_p)
VALUES (1, 1, 'image', 'Nom produit 1', 1);

INSERT INTO projet.inventaire (id_inventaire)
VALUES (1);

INSERT INTO projet.achat (produit_achat)
VALUES ('1');

INSERT INTO projet.remplissage (id_remplissage)
VALUES (1);

INSERT INTO projet.caracteristique_produit (nom_caracteristique_p, id_type_caracteristique_p)
VALUES ('Caractéristique produit 1', 1);

INSERT INTO projet.machine (emplacement_machine, nom_machine, id_type_m, id_remplissage)
VALUES ('Emplacement 1', 'Nom 1', 1, 1);

-- Insert into projet.usager
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
    ('stel2002');

-- Insert into projet.usager_x_machines
INSERT INTO projet.usager_x_machines (id_usager, id_machine)
VALUES 
    ('rama2001', 1),
    ('gasb3002', 1),
    ('pald2501', 1),
    ('chab1704', 1),
    ('rene1902', 1),
    ('saua5384', 1),
    ('beab1802', 1),
    ('garn1201', 1),
    ('maif1401', 1),
    ('mons2007', 1),
    ('brij0701', 1),
    ('gaue1909', 1),
    ('tchj1603', 1),
    ('cotr1509', 1),
    ('belv1805', 1),
    ('legm1303', 1),
    ('ricr1604', 1),
    ('lafa2013', 1),
    ('meda4684', 1),
    ('larv1803', 1),
    ('latq4202', 1),
    ('boua2511', 1),
    ('lanc0902', 1),
    ('graf2102', 1),
    ('camz1901', 1),
    ('stlm1906', 1),
    ('frae2001', 1),
    ('roya1619', 1),
    ('seil7357', 1),
    ('rerm1001', 1),
    ('goux1801', 1),
    ('labb1405', 1),
    ('gaud1401', 1),
    ('rodz1401', 1),
    ('cars1804', 1),
    ('laus1801', 1),
    ('boua1424', 1),
    ('lall2411', 1),
    ('cous1912', 1),
    ('more2101', 1),
    ('pouc1302', 1),
    ('farg2101', 1),
    ('lesj0901', 1),
    ('stel2002', 1);

-- Insert into projet.usager_x_produit
INSERT INTO projet.usager_x_produit (id_usager, id_produit)
VALUES 
    ('rama2001', 1),
    ('gasb3002', 1),
    ('pald2501', 1),
    ('chab1704', 1),
    ('rene1902', 1),
    ('saua5384', 1),
    ('beab1802', 1),
    ('garn1201', 1),
    ('maif1401', 1),
    ('mons2007', 1),
    ('brij0701', 1),
    ('gaue1909', 1),
    ('tchj1603', 1),
    ('cotr1509', 1),
    ('belv1805', 1),
    ('legm1303', 1),
    ('ricr1604', 1),
    ('lafa2013', 1),
    ('meda4684', 1),
    ('larv1803', 1),
    ('latq4202', 1),
    ('boua2511', 1),
    ('lanc0902', 1),
    ('graf2102', 1),
    ('camz1901', 1),
    ('stlm1906', 1),
    ('frae2001', 1),
    ('roya1619', 1),
    ('seil7357', 1),
    ('rerm1001', 1),
    ('goux1801', 1),
    ('labb1405', 1),
    ('gaud1401', 1),
    ('rodz1401', 1),
    ('cars1804', 1),
    ('laus1801', 1),
    ('boua1424', 1),
    ('lall2411', 1),
    ('cous1912', 1),
    ('more2101', 1),
    ('pouc1302', 1),
    ('farg2101', 1),
    ('lesj0901', 1),
    ('stel2002', 1);



-- Création de Vue pour la comunication avec le backend

CREATE OR REPLACE VIEW machine_inventory_page AS
SELECT
    projet.machine.nom_machine,
    projet.machine.image_machine,
    projet.usager.id_usager
FROM
    projet.usager_x_machines
        JOIN projet.machine ON machine.id_machine = usager_x_machines.id_machine
        JOIN projet.usager ON usager.id_usager = usager_x_machines.id_usager;

CREATE OR REPLACE VIEW machine_inventory_specific AS
SELECT
    projet.machine.*,
    projet.usager.id_usager
FROM
    projet.usager_x_machines
        JOIN projet.machine ON machine.id_machine = usager_x_machines.id_machine
        JOIN projet.usager ON usager.id_usager = usager_x_machines.id_usager;

CREATE OR REPLACE VIEW product_inventory_page AS
SELECT
    projet.produit.image_produit,
    projet.produit.quantite_produit,
    projet.produit.nom_produit,
    projet.usager.id_usager
FROM
    projet.usager_x_produit
        JOIN projet.produit ON produit.id_produit = usager_x_produit.id_produit
        JOIN projet.usager ON usager.id_usager = usager_x_produit.id_usager;

CREATE OR REPLACE VIEW product_inventory_specific AS
SELECT
    projet.produit.*,
    projet.usager.id_usager
FROM
    projet.usager_x_produit
        JOIN projet.produit ON produit.id_produit = usager_x_produit.id_produit
        JOIN projet.usager ON usager.id_usager = usager_x_produit.id_usager;

CREATE OR REPLACE VIEW machine_template_page AS
    SELECT
        projet.type_de_machine.image_type_m,
        projet.type_de_machine.model_type_m,
        projet.type_de_machine.manufacturier_type_m,
        projet.usager_x_machines.id_usager
    FROM
        projet.type_de_machine
            JOIN projet.machine ON machine.id_type_m = type_de_machine.id_type_m
            JOIN projet.usager_x_machines ON machine.id_machine = usager_x_machines.id_machine;

CREATE OR REPLACE VIEW machine_template_specific AS
    SELECT
        projet.type_de_machine.*,
        projet.usager_x_machines.id_usager
    FROM
        projet.type_de_machine
            JOIN projet.machine ON machine.id_type_m = type_de_machine.id_type_m
            JOIN projet.usager_x_machines ON machine.id_machine = usager_x_machines.id_machine;

CREATE OR REPLACE VIEW product_template_page AS
    SELECT
        projet.type_de_produit.image_type_p,
        projet.type_de_produit.manufacturier_type_p,
        projet.type_de_produit.model_type_p,
        projet.usager_x_produit.id_usager
    FROM
        projet.type_de_produit
            JOIN projet.produit ON produit.id_type_p = type_de_produit.id_type_p
            JOIN projet.usager_x_produit ON produit.id_produit = usager_x_produit.id_produit;

CREATE OR REPLACE VIEW product_template_specific AS
    SELECT
        projet.type_de_produit.*,
        projet.usager_x_produit.id_usager
    FROM
        projet.type_de_produit
            JOIN projet.produit ON produit.id_type_p = type_de_produit.id_type_p
            JOIN projet.usager_x_produit ON produit.id_produit = usager_x_produit.id_produit;
