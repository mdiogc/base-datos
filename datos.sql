PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE propietarios 

( id integer not null primary key autoincrement,
nombre text not null,
apellido text not null,
dni text unicode );
INSERT INTO propietarios VALUES(1,'Juan','Perez','12345678A');
INSERT INTO propietarios VALUES(2,'Maria','Lopez','87654321B');
INSERT INTO propietarios VALUES(3,'Carlos','Ruiz','11111111C');
INSERT INTO propietarios VALUES(4,'Laura','Gomez','22222222D');
INSERT INTO propietarios VALUES(5,'Pedro','Martinez','33333333E');
INSERT INTO propietarios VALUES(6,'Ana','Fernandez','44444444F');
INSERT INTO propietarios VALUES(7,'Diego','Sanchez','55555555G');
INSERT INTO propietarios VALUES(8,'Sofia','Torrez','66666666H');
INSERT INTO propietarios VALUES(9,'Javier','Leon','77777777I');
INSERT INTO propietarios VALUES(10,'Lucia','Castillo','88888888J');
INSERT INTO propietarios VALUES(11,'Luis','Gonzalez','99999999K');
INSERT INTO propietarios VALUES(12,'Marta','Diaz','10101010L');
INSERT INTO propietarios VALUES(13,'Victor','Vargas','11111112M');
INSERT INTO propietarios VALUES(14,'Elena','Castro','12121212N');
INSERT INTO propietarios VALUES(15,'Roberto','Blanco','13131313O');
INSERT INTO propietarios VALUES(16,'Natalia','Paredes','14141414P');
INSERT INTO propietarios VALUES(17,'Fernando','Herrera','15151515Q');
INSERT INTO propietarios VALUES(18,'Clara','Soto','16161616R');
INSERT INTO propietarios VALUES(19,'Sergio','Mendoza','17171717S');
INSERT INTO propietarios VALUES(20,'Patricia','Navarro','18181818T');
CREATE TABLE vehiculos 

( id integer not null primary key autoincrement,
marca text not null, 
modelo text not null, 
anio integer not null, 
id_propietario integer references propietarios(id_propietario));
INSERT INTO vehiculos VALUES(1,'Ford','Fiesta',2019,1);
INSERT INTO vehiculos VALUES(2,'Toyota','Corolla',2018,2);
INSERT INTO vehiculos VALUES(3,'Nissan','Sentra',2020,3);
INSERT INTO vehiculos VALUES(4,'Chevrolet','Spark',2017,4);
INSERT INTO vehiculos VALUES(5,'Honda','Civic',2016,5);
INSERT INTO vehiculos VALUES(6,'Ford','Mustang',2021,6);
INSERT INTO vehiculos VALUES(7,'Toyota','RAV4',2019,7);
INSERT INTO vehiculos VALUES(8,'Volkswagen','Golf',2020,8);
INSERT INTO vehiculos VALUES(9,'Honda','CR-V',2018,9);
INSERT INTO vehiculos VALUES(10,'Nissan','Altima',2017,10);
INSERT INTO vehiculos VALUES(11,'Chevrolet','Malibu',2019,11);
INSERT INTO vehiculos VALUES(12,'Toyota','Camry',2020,12);
INSERT INTO vehiculos VALUES(13,'Honda','Accord',2018,13);
INSERT INTO vehiculos VALUES(14,'Ford','Explorer',2021,14);
INSERT INTO vehiculos VALUES(15,'Nissan','Rogue',2017,15);
INSERT INTO vehiculos VALUES(16,'Volkswagen','Jetta',2019,16);
INSERT INTO vehiculos VALUES(17,'Chevrolet','Equinox',2018,17);
INSERT INTO vehiculos VALUES(18,'Toyota','Highlander',2020,18);
INSERT INTO vehiculos VALUES(19,'Honda','Odyssey',2016,19);
INSERT INTO vehiculos VALUES(20,'Nissan','Murano',2019,20);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('propietarios',20);
INSERT INTO sqlite_sequence VALUES('vehiculos',20);
COMMIT;
