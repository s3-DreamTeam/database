INSERT INTO projet.usager_x_machines (usager_id, machine_id)
VALUES (1, 1);

CREATE VIEW machine_usager AS
SELECT
    projet.machine.machine_id,
    projet.usager.nom
FROM
  projet.usager_x_machines
    JOIN projet.machine ON machine.machine_id = usager_x_machines.machine_id
    JOIN projet.usager ON usager.usager_id = usager_x_machines.usager_id;