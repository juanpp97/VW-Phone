USE tienda;
CREATE TABLE especificacion (
    codigo_modelo VARCHAR(20) PRIMARY KEY UNIQUE NOT NULL,
    camara_principal VARCHAR(20) NOT NULL DEFAULT "",
    camara_frontal VARCHAR(20) NOT NULL DEFAULT "",
    flash VARCHAR(2) NOT NULL DEFAULT "",
    memoria_interna_rom VARCHAR(10) NOT NULL DEFAULT "",
    memoria_ram VARCHAR(20) NOT NULL DEFAULT "",
    tamanio_pantalla VARCHAR(20) NOT NULL DEFAULT "",
    pantalla_tipo VARCHAR(50) NOT NULL DEFAULT "",
    pantalla_resolucion VARCHAR(50) NOT NULL DEFAULT "",
    tipo_de_red VARCHAR(3) NOT NULL DEFAULT "",
    wi_fi VARCHAR(2) NOT NULL DEFAULT "",
    puerto_micro_usb VARCHAR(50) NOT NULL DEFAULT "",
    gps VARCHAR(2) NOT NULL DEFAULT "",
    nfc VARCHAR(2) NOT NULL DEFAULT "",
    bluetooth VARCHAR(2) NOT NULL DEFAULT "",
    sistema_operativo VARCHAR(50) NOT NULL DEFAULT "",
    procesador VARCHAR(50) NOT NULL DEFAULT "",
    color VARCHAR(20) NOT NULL DEFAULT "",
    bateria VARCHAR(10) NOT NULL DEFAULT "",
    dimensiones VARCHAR(50) NOT NULL DEFAULT "",
    peso VARCHAR(10) NOT NULL DEFAULT ""
);
CREATE TABLE stock ( 
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    imagen_modelo VARCHAR(20) NOT NULL UNIQUE,
    nombre_modelo VARCHAR(30) NOT NULL UNIQUE,
    tipo_celular VARCHAR (20) NOT NULL,
    codigo_modelo VARCHAR (20) NOT NULL UNIQUE,
    marca VARCHAR (30) NOT NULL, 
    valor_unitario DECIMAL(10,2) NOT NULL,  
    cantidad INT NOT NULL,
    CONSTRAINT fstock FOREIGN KEY(codigo_modelo) REFERENCES especificacion(codigo_modelo)
);


INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("SM-23", "50 megapixeles", "12 megapixeles", "Si","256 gb","8 gb", "6.1 pulgadas", "Dinamic Amoled 2X", "2340 x 1080 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si","Si", "Android", "Qualcomm Octa-Core 3.36GHz-2.8GHz-2GHz", "Phantom Black", "3900 mAh", "146.3 x 70.9 x 7.6 mm", "168 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("SM-23P", "50 megapixeles", "12 megapixeles", "Si","256 gb","8 gb", "6.6 pulgadas", "Dinamic Amoled 2X", "2340 x 1080 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si","Si", "Android", "Qualcomm Octa-Core 3.36GHz-2.8GHz-2GHz", "Phantom Black", "4700 mAh", "157.8 x 76.2 x 7.6 mm", "195 gr");
USE tienda;

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("SM-23U", "200 megapixeles", "12 megapixeles", "Si","256 gb","8 gb", "6.8 pulgadas", "Dinamic Amoled 2X", "3088 x 1440 quadHD", "5G", "Si", "Micro usb tipo c", "Si", "Si","Si", "Android", "Qualcomm Octa-Core 3.36GHz-2.8GHz-2GHz", "Phantom Black", "5000 mAh", "163.4 x 78.1 x 8.9 mm", "233 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("SM-54", "50 megapixeles", "32 megapixeles", "Si","256 gb","8 gb", "6.4 pulgadas", "Super Amoled", "1080 x 2340 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si","Si", "Android", "Octacore", "Lime", "5000 mAh", "158.2 x 76.7 x 8.2 mm", "202 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("SM-22", "50 megapixeles", "10 megapixeles", "Si","128 gb","8 gb", "6.1 pulgadas", "Dinamic Amoled 2x", "2340 x 1080 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si","Si", "Android", "Octacore", "White", "3700 mAh", "
146.0 x 70.6 x 7.6 mm", "167 gr");


INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("MM-E30U", "200 megapixeles", "60 megapixeles", "Si", "256 gb", "12 gb", "6.6 pulgadas", "P Oled", "1080 x 2400 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "
Octa core 3.2 Ghz", "Negro", "4610 mAh", "161.76 x 73.5 x 8.39 mm", "199 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("MM-E30F", "50 megapixeles", "32 megapixeles", "Si", "256 gb", "12 gb", "6.5 pulgadas", "P Oled", "1080 x 2400 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "
Octa core 2.84 Ghz", "Negro", "4400 mAh", "158.48 x 71.99 x 7.45 mm", "175 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("MM-G42", "50 megapixeles", "16 megapixeles", "Si", "128 gb", "4 gb", "6.4 pulgadas", "G Oled", "1080 x 2400 fullHD", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "
Octa core 2.4 Ghz", "Verde Lima", "5000 mAh", "160.4 x 73.47 x 7.99 mm", "174 gr"); 

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("MM-G72", "108 megapixeles", "16 megapixeles", "Si", "128 gb", "6 gb", "6.5 pulgadas", "P Oled", "fullHD", "4G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "
Mediatek Helio G99", "Blanco Brillante", "5000 mAh", "160.47 x 74.4 x 7.89 mm", "170 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("MM-G32", "50 megapixeles", "16 megapixeles", "Si", "128 gb", "4 gb", "6.4 pulgadas", "P Oled", "1800 x 2400", "4G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "
Octa core 2.4 GHz", "Blanco Brillante", "5000 mAh", "161.78 x 73.84 x 8.49 mm", "180 gr");


INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("I-13", "12 megapixeles", "12 megapixeles", "Si","512 gb", "4gb", "6.1 pulgadas", "fullHD", "2532 x 1170 px", "5G", "Si", "Conector Apple", "Si", "Si", "Si", "IOS", "Apple A15 Bionic", "Azul", "3227 mAh", "146,7 x 71,5 x 7,6 mm", "173 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("I-11", "12 megapixeles", "12 megapixeles","Si","256 gb", "4 gb", "6.1 pulgadas", "IPS-LCD", "1792 x 828 px", "5G", "Si", "Conector Apple", "Si", "Si", "Si", "IOS", "Apple A13 Bionic", "Blanco", "3110 mAh", "150,9 x 75,7 x 8,3 mm", "194 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("I-SE", "12 megapixeles", "7 megapixeles", "Si", "256 gb", "3 gb", "4.7 pugadas", "IPS-LCD", "1334 x 750 px", "5G", "Si", "Conector Apple", "Si", "Si", "Si", "IOS", "Apple A13 Bionic", "Rojo", "1821 mAh", "138,4 x 37,3 x 7,3 mm", "148 gr");


INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("Poco-F3", "48 megapixeles", "20 megapixeles", "Si", "128 gb", "6 gb", "6.67 pulgadas", "Amoled fullHD", "2400 x 1080 px", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "MIUI 12", "Qualcomm® Snapdragon™ 870", "Azul", "4520 mAh", "163.7x76.4x7.8 mm", "196 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("Mi-11", "64 megapixeles", "16 megapixeles", "Si", "128 gb", "8 gb", "6.55 pulgadas", "Amoled ", "2400 x 1080 px", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "MIUI 12.5/Android", "Qualcomm® Snapdragon™ 778", "Azul", "4520 mAh", "160.53x75.73x6.81 mm", "158 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("Poco-X4Pro", "108 megapixeles", "16 megapixeles", "Si", "128 gb", "6 gb", "6.67 pulgadas", "Amoled fullHD ", "2400 x 1080 px", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "MIUI 13/Android", "Snapdragon™ 695", "Amarillo", "5000 mAh", "164.19x76.1x8.12 mm", "205 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("Note-11", "50 megapixeles", "13 megapixeles", "Si", "128 gb", "6 gb", "6.43 pulgadas", "Amoled fullHD ", "1080 x 2040 px", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "MIUI 13/Android", "Snapdragon™ 680", "Azul", "5000 mAh", "159.87x73.87x8.09 mm", "179 gr");



INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("A-31", "50 megapixeles", "No posee", "Si", "32 gb", " 2 gb", "6 pulgadas", "LCD", "179 ppp", "4G", "Si", "Micro usb tipo a", "Si", "Si", "Si", "Android R", "Unisoc SC9863A", "Marron", "3000 mAh", "140 x 71 x 8.9 mm","166 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("A-52", "13 megapixeles", "5 megapixeles", "Si", "64 gb", "2 gb", "6.52 pulgadas", "LCD", "HD+", "5G", "Si", "Micro usb tipo a", "Si", "Si", "Si", "Android", "Unisoc SC9863A", "Azul", "5000 mAh", "164 x 75.8 x 8.7 mm", "193 gr"); 

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("A-71", "16 megapixeles", "8 megapixeles", "Si", "64 gb", "3 gb", "6.52 pulgadas", "LCD", "HD", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "Unisoc SC9863A", "Negro", "4000 mAh", "165.2 x 75.2 x 8.2 mm", "180 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("A-53", "13 megapixeles", "5 megapixeles", "Si", "64 gb", "2 gb + 2gb virtuales", "6.52 pulgadas", "LCD", "HD", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "Octa-Core", "Rojo", "4000 mAh", "16.5 x 7.64 x 0.9 cm", "198 gr");

INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("V-30", "48 megapixeles", "8 megapixeles", "Si", "128 gb", "3 gb", "6.8 pulgadas", "LCD", "720 x 1640 px", "5G", "Si", "Micro usb tipo c", "Si", "Si", "Si", "Android", "Octacore 4 nucleos", "Azul", "5000 mAh", "7.8 x 17.3 x 0.89 cm", "210 gr");

INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("SM-23.webp", "S23 ","Smartphone","SM-23","Samsung","369999.00",50);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("SM-23P.webp", "S23 Plus","Smartphone","SM-23P","Samsung","509999.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("SM-23U.webp","S23 Ultra","Smartphone","SM-23U","Samsung","369999.00",15);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("SM-54.webp", "A54","Smartphone","SM-54","Samsung","226999.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("SM-22.webp", "S22","Smartphone","SM-22","Samsung","279999.00",30);

INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("MM-E30U.webp", "Moto Edge-30 Ultra","Smartphone","MM-E30U","Motorola","364999.00",18);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("MM-E30F.webp", "Moto Edge-30 Fusión","Smartphone","MM-E30F","Motorola","239999.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("MM-G42.webp", "Moto G42","Smartphone","MM-G42","Motorola","89999.00",15);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("MM-G72.webp", "Moto G72","Smartphone","MM-G72","Motorola","134999.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("MM-G32.webp", "Moto G32","Smartphone","MM-G32","Motorola","121999.00",18);

INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("I-13.webp", "Iphone 13","Smartphone","I-13","Apple","1479900.00",5);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("I-11.webp", "Iphone 11","Smartphone","I-11","Apple","620900.00",8);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("I-SE.webp", "Iphone SE","Smartphone","I-SE","Apple","799999.00",0);

INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("Poco-F3.webp", "Poco F3","Smartphone","Poco-F3","Xiaomi","319199.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("Mi-11.webp", "Mi 11","Smartphone","Mi-11","Xiaomi","238899.00",17);
INSERT INTO stock (imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("Poco-X4Pro.webp", "Poco X4 Pro","Smartphone","Poco-X4Pro","Xiaomi","289499.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("Note-11.webp", "Redmi Note 11","Smartphone","Note-11","Xiaomi","108999.00",0);

INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("A31.webp", "Blade A31","Smartphone","A-31","ZTE","29999.00",7);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("A-52.webp", "Blade A52","Smartphone","A-52","ZTE","39999.00",0);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("A-71.webp", "Blade A71","Smartphone","A-71","ZTE","44999.00",12);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("A-53.webp", "Blade A53","Smartphone","A-53","ZTE","42999.00",13);
INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("V-30.webp", "Blade V30","Smartphone","V-30","ZTE","58799.00",0);
USE tienda;
SELECT * FROM stock, especificacion
SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo ORDER BY stock.id


DELETE stock, especificacion FROM stock JOIN especificacion ON stock.codigo_modelo = especificacion.modelo WHERE stock.codigo_modelo LIKE 'SM-23' OR especificacion.modelo LIKE 'SM-23';

/* SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.modelo
SELECT * FROM stock
SELECT * FROM especificacion
DELETE stock, especificacion FROM stock
JOIN especificacion ON stock.codigo_modelo = especificacion.modelo
WHERE stock.codigo_modelo LIKE 'SM-23' OR especificacion.modelo LIKE 'SM-23';
*/

/* SELECT nombre_modelo, marca, valor_unitario, cantidad FROM stock*/
SELECT COUNT(*) as numero FROM stock
USE tienda;

SHOW CREATE TABLE stock;
DELETE stock, especificacion FROM stock JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo;
USE tienda;

ALTER TABLE stock DROP FOREIGN KEY fstock;
DELETE stock,especificacion FROM stock JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo WHERE stock.codigo_modelo LIKE 'N-9S' OR especificacion.codigo_modelo LIKE 'N-9S';
ALTER TABLE stock ADD CONSTRAINT `fstock` FOREIGN KEY (codigo_modelo) REFERENCES especificacion(codigo_modelo);
UPDATE stock
JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo
SET stock.nombre_modelo = "S23",
    stock.tipo_celular = "Smartphone",
    stock.codigo_modelo = "SM-23",
    especificacion.codigo_modelo = "SM-23",
    stock.marca = "Samsung",
    stock.valor_unitario = "369998.00",
    stock.cantidad = "50",
    especificacion.camara_principal = "50 megapixeles",
    especificacion.camara_frontal = "12 megapixeles",
    especificacion.flash = "Si",
    especificacion.memoria_interna_rom = "256 gb",
    especificacion.memoria_ram = "8 gb",
    especificacion.tamanio_pantalla = "6.1 pulgadas",
    especificacion.pantalla_tipo = "Dinamic Amoled 2X",
    especificacion.pantalla_resolucion = "2340 x 1080 fullHD",
    especificacion.tipo_de_red = "5G",
    especificacion.wi_fi = "Si",
    especificacion.puerto_micro_usb = "Micro usb tipo C",
    especificacion.gps = "Si",
    especificacion.nfc = "Si",
    especificacion.bluetooth = "Si",
    especificacion.sistema_operativo = "Android",
    especificacion.procesador = "Qualcomm Octa-Core 3.36GHz-2.8GHz-2GHz",
    especificacion.dimensiones = "146.3 x 70.9 x 7.6 mm",
    especificacion.color = "Phantom Black",
    especificacion.bateria = "3900 mAh",
    especificacion.peso = "168 g"
WHERE stock.id = "1";

USE tienda;
SELECT nombre_modelo, marca FROM stock ORDER BY rand() LIMIT 6;