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

INSERT INTO projet.caractèristique_machine (nom, type_caracteristique_m_id)
VALUES ('Caractéristique machine 1', 1);

INSERT INTO projet.type_de_machine (model, manufacturier, no_serie)
VALUES ('Model 1', 'Manufacturier 1', 'No de série 1');

INSERT INTO projet.dimension (nom, largeur, hauteur, longueur, forme, produit_par_unité, est_emballé)
VALUES (1, 1, 1, 1, 'Forme 1', 1, TRUE);

INSERT INTO projet.type_de_produit (nom, marge, dimension_id)
VALUES ('Type de produit 1', 10, 1);

INSERT INTO projet.produit (quantite, prix_achat)
VALUES (1, 1);

INSERT INTO projet.inventaire (inventaire_id)
VALUES (1);

INSERT INTO projet.achat (produit)
VALUES ('1');

INSERT INTO projet.remplissage (id_remplissage)
VALUES (1);

INSERT INTO projet.caractèristique_produit (nom, type_caracteristique_p_id)
VALUES ('Caractéristique produit 1', 1);

INSERT INTO projet.machine (emplacement, nom, type_m_id, id_remplissage, achat_id)
VALUES ('Emplacement 1', 'Nom 1', 1, 1, 1);

INSERT INTO projet.usager (nom, prenom, solde, email, profil_pic, status_id)
VALUES ('Nom 1', 'Prenom 1', 1, 'test', 'test', 1);