SELECT
            manufacturier_type_m,
            model_type_m,
            id_type_m
        FROM
            projet.type_de_machine
        WHERE id_type_m = 1 AND id_usager = 'graf2102';
