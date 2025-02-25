INSERT INTO 
 `DB_Hice`.`TB_House`
(
 `vID`,
 `sAddress`,
 `uSurfaceAreaM2`
)
VALUES
 (
  UNHEX(REPLACE('26ab96c9-a844-4efd-b7ea-a83c773455c5', '-', '')),
  'Address 0',
  100
 ),
 (
  UNHEX(REPLACE('2ad4f72d-1d2d-4558-926b-c8d54d84614b', '-', '')),
  'Address 1',
  200
 ),
 (
  UNHEX(REPLACE('54818654-80cf-4422-926c-6bcab71af3e2', '-', '')),
  'Address 2',
  300
 ),
 (
  UNHEX(REPLACE('755a7b2f-4bf0-41c7-9db0-5e53761358c7', '-', '')),
  'Address 3',
  400
 ),
 (
  UNHEX(REPLACE('735ed561-562b-4d8a-9091-50117400ae30', '-', '')),
  'Address 4',
  500
 );
INSERT INTO
 `DB_Hice`.`TB_HouseListing`
(
 `vID`,
 `vHouseID`,
 `dtmCreatedOn`,
 `uPriceCents`,
 `uSaleType`
)
VALUES
 (
  UNHEX(REPLACE('936bd4a3-a135-41f1-aa59-4e0cd7a18718', '-', '')),
  UNHEX(REPLACE('26ab96c9-a844-4efd-b7ea-a83c773455c5', '-', '')),
  NOW(),
  1000000,
  'Sale'
 ),
 (
  UNHEX(REPLACE('5f799955-86e5-450a-9a3e-31e237270a4c', '-', '')),
  UNHEX(REPLACE('2ad4f72d-1d2d-4558-926b-c8d54d84614b', '-', '')),
  NOW(),
  1500000,
  'Auction'
 ),
 (
  UNHEX(REPLACE('d3d1d13b-46f1-42ef-b7c2-c1a3cd435327', '-', '')),
  UNHEX(REPLACE('54818654-80cf-4422-926c-6bcab71af3e2', '-', '')),
  NOW(),
  2000000,
  'Negotiate'
 ),
 (
  UNHEX(REPLACE('95c303dc-f4e6-4f3b-8679-824d444e9ba2', '-', '')),
  UNHEX(REPLACE('735ed561-562b-4d8a-9091-50117400ae30', '-', '')),
  NOW(),
  2500000,
  'Rent'
 );
INSERT INTO
 `DB_Hice`.`TB_HouseListingImage`
(
 `vID`,
 `vHouseListingID`
)
VALUES
 (
  UNHEX(REPLACE('26ab96c9-a844-4efd-b7ea-a83c773455c5', '-', '')),
  UNHEX(REPLACE('936bd4a3-a135-41f1-aa59-4e0cd7a18718', '-', ''))
 ),
 (
  UNHEX(REPLACE('54818654-80cf-4422-926c-6bcab71af3e2', '-', '')),
  UNHEX(REPLACE('5f799955-86e5-450a-9a3e-31e237270a4c', '-', ''))
 ),
 (
  UNHEX(REPLACE('735ed561-562b-4d8a-9091-50117400ae30', '-', '')),
  UNHEX(REPLACE('d3d1d13b-46f1-42ef-b7c2-c1a3cd435327', '-', ''))
 ),
 (
  UNHEX(REPLACE('662ee842-e17c-48e3-a3a4-05b9cb7d3c83', '-', '')),
  UNHEX(REPLACE('95c303dc-f4e6-4f3b-8679-824d444e9ba2', '-', ''))
 );
