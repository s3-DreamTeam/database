 UPDATE projet.inventaire
        SET id_produit = 1, quantite_inventaire = 0
        WHERE id_machine = 1 AND slot_inventaire = 'A1';