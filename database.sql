 SELECT
            EXISTS (
                SELECT 1
                FROM projet.machine
                WHERE machine.id_type_m = 2 AND machine.id_usager = 'lanc0902'
            ) AS result;