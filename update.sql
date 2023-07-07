USE tienda;
SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.modelo

SHOW CREATE TABLE stock;
ALTER TABLE stock DROP FOREIGN KEY fstock;
UPDATE stock
JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo
SET stock.nombre_modelo = ,
    stock.tipo_celular = ,
    stock.codigo_modelo = ,
    especificacion.codigo_modelo,
    stock.marca = ,
    stock.valor_unitario = ,
    stock.cantidad = ,
    especificacion.camara_principal = ,
    especificacion.camara_frontal = ,
    especificacion.flash = ,
    especificacion.memoria_interna_rom = ,
    especificacion.memoria_ram = ,
    especificacion.tamanio_pantalla = ,
    especificacion.pantalla_tipo = ,
    especificacion.pantalla_resolucion = ,
    especificacion.tipo_de_red = ,
    especificacion.wi_fi = ,
    especificacion.puerto_micro_usb = ,
    especificacion.gps = ,
    especificacion.nfc = ,
    especificacion.bluetooth = ,
    especificacion.sistema_operativo = ,
    especificacion.procesador = ,
    especificacion.color = ,
    especificacion.bateria = ,
    especificacion.peso = ,
WHERE stock.id = 2;
ALTER TABLE stock ADD CONSTRAINT `fstock` FOREIGN KEY (codigo_modelo) REFERENCES especificacion(codigo_modelo);

SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo
