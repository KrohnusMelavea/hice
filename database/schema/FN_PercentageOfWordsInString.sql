DELIMITER ;;

CREATE FUNCTION
 `DB_Hice`.`FN_PercentageOfWordsInString`
 (
  sWords  NVARCHAR(255),
  sString NVARCHAR(255)
 )
 RETURNS FLOAT
 DETERMINISTIC
BEGIN
 DECLARE uWordFoundCount INTEGER UNSIGNED DEFAULT 0;
 DECLARE uIndex          INTEGER UNSIGNED DEFAULT 0;
 DECLARE uTotal          INTEGER UNSIGNED DEFAULT LENGTH(sWords) - LENGTH(REPLACE(sWords, ' ', '')) + 1;

 WHILE (uIndex < uTotal) DO
  IF LENGTH(sString) - LENGTH(REPLACE(sString, SUBSTRING_INDEX(SUBSTRING_INDEX(sWords, ' ', uIndex + 1), ' ', -1), '')) != 0 THEN
   SET uWordFoundCount = uWordFoundCount + 1;
  END IF;
  SET uIndex = uIndex + 1;
 END WHILE;

 RETURN CAST(uWordFoundCount AS FLOAT) / CAST(uTotal AS FLOAT);
END;;

DELIMITER ;