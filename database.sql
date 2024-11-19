INSERT INTO projet.produit (quantite_produit, prix_achat_produit, image_produit, nom_produit, id_usager, id_type_p)
VALUES (1, 1, 'image', 'Nom produit 1', 'graf2102', 1);

INSERT INTO projet.inventaire (id_inventaire, slot_inventaire, id_produit, id_machine)
VALUES (2, 'A2', 1, 1);

UPDATE projet.inventaire
        SET id_produit = 2
        WHERE id_machine = 1 AND slot_inventaire = 'A2';