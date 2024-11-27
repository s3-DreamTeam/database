SELECT
            id_machine,
            slot_inventaire,
            CASE
                WHEN inventaire.id_produit = 1 THEN -1
                ELSE  inventaire.id_produit
                END AS  id_produit,
            quantite_inventaire,
            prix_achat_produit
        FROM
            projet.inventaire
                JOIN projet.produit p ON p.id_produit = inventaire.id_produit
        WHERE
            inventaire.id_machine = 6;
