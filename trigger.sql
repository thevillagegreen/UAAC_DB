DROP TRIGGER IF EXISTS insert_newest_animal_list;
DROP TRIGGER IF EXISTS update_newest_animal_list;
DROP TRIGGER IF EXISTS delete_newest_animal_list;

DELIMITER $$
-- Think trigger may be wrong
CREATE TRIGGER insert_newest_animal_list
AFTER INSERT on ANIMAL
FOR EACH ROW
BEGIN
  CALL newest_animal_table();
END$$

-- Think trigger may be wrong
CREATE TRIGGER update_newest_animal_list
AFTER UPDATE on ANIMAL
FOR EACH ROW
BEGIN
  CALL newest_animal_table();
END$$

-- Think trigger may be wrong
CREATE TRIGGER delete_newest_animal_list
AFTER DELETE on ANIMAL
FOR EACH ROW
BEGIN
  CALL newest_animal_table();
END$$

DELIMITER ;
