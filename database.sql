DO $$
DECLARE
    deleted_row RECORD;
BEGIN
    DELETE FROM projet.usager_x_machines
    WHERE id_usager = 'graf2102' AND id_machine = 1
    RETURNING * INTO deleted_row;

    IF deleted_row IS NOT NULL THEN
    DELETE
    FROM projet.machine
    WHERE id_machine = 1;
    END IF;
END $$;