SELECT
 `DB_Hice`.`TB_House`.`sAddress` AS `sHouseAddress`,
 `DB_Hice`.`TB_HouseListingImage`.`vID` AS `vHouseListingImageID`
FROM
(
`DB_Hice`. `TB_House`
INNER JOIN
 `DB_Hice`.`TB_HouseListing`
  ON
   `DB_Hice`.`TB_House`.`vID` = `DB_Hice`.`TB_HouseListing`.`vHouseID`
INNER JOIN
 `DB_Hice`.`TB_HouseListingImage`
  ON
   `DB_Hice`.`TB_HouseListing`.`vID` = `DB_Hice`.`TB_HouseListingImage`.`vHouseListingID`
)
WHERE
 `DB_Hice`.`TB_HouseListing`.`vID` = UNHEX(REPLACE('%s', '-', ''));