SELECT
            id_machine
        FROM projet.machine
        WHERE id_machine = (SELECT MAX(id_machine) FROM projet.machine)