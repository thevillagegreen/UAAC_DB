DROP TEMPORARY TABLE IF EXISTS NEWEST_ANIMAL;

CREATE TEMPORARY TABLE NEWEST_ANIMAL (
  Animal_ID VARCHAR(100) NOT NULL,
  Animal_Name VARCHAR(50) NOT NULL,
  Animal_Type VARCHAR(10),
  Date_In DATE,
  PRIMARY KEY (Animal_ID, Animal_Name)
);

DROP PROCEDURE IF EXISTS newest_animal_table;

DELIMITER $$

CREATE PROCEDURE newest_animal_table ()
  BEGIN

  DECLARE v_finished INTEGER DEFAULT 0;
  DECLARE v_id VARCHAR(100) DEFAULT "";
  DECLARE v_name VARCHAR(50);
  DECLARE v_type VARCHAR(10);
  DECLARE v_date DATE;

  DECLARE animal_cursor CURSOR FOR
  SELECT Animal_ID, Animal_Name, Animal_Type, Date_In
    FROM ANIMAL_VIEW
    WHERE Date_IN IS NOT NULL AND Animal_ID NOT IN
      (SELECT Animal_ID FROM NEWEST_ANIMAL)
     LIMIT 10;

  DECLARE CONTINUE HANDLER
  FOR NOT FOUND SET v_finished = 1;

  OPEN animal_cursor;

  get_animal: LOOP

  FETCH animal_cursor INTO v_id, v_name, v_type, v_date;

  IF v_finished = 1 OR v_date IS NULL THEN
    LEAVE get_animal;
  END IF;

  INSERT INTO NEWEST_ANIMAL VALUES (v_id, v_name, v_type, v_date);

  END LOOP get_animal;

  CLOSE animal_cursor;

END$$

DELIMITER ;

CALL newest_animal_table();
