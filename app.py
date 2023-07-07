from flask import Flask, render_template, request, jsonify, redirect, url_for, flash
from database import conectar, cerrar
from cambiar import modificar
from werkzeug.utils import secure_filename
from celular import Celular
import os

app = Flask(__name__)

carpeta = 'static/img/'
ext_permitidas = ['png', 'jpg', 'jpeg', 'gif', 'webp', 'avif']
app.secret_key = b'_sdsa4582L"F4Q8z]/'
app.config['UPLOAD_FOLDER'] = carpeta

def ordenar_id(db):
    cursor = db.cursor()
    cursor.execute(f"SET @count = 0")
    cursor.execute(f"UPDATE stock SET id = @count:=@count+1")
    db.commit()
    cursor.close()



@app.route("/")
def index():
    cnx = conectar()
    cursor = cnx.cursor()
    cursor.execute("SELECT nombre_modelo, marca, imagen_modelo FROM stock ORDER BY rand() LIMIT 6")
    datos = cursor.fetchall();
    cursor.close()
    cnx.close()
    return render_template("index.html", datos = datos)

@app.route("/catalogo")
def catalogo():
    return render_template("catalogo.html")
@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/carrito")
def carrito():
    return render_template("carrito.html")


@app.route("/stock", methods=["GET"])
def obtener_datos():
    if request.method == "GET":
        cnx = conectar()
        cursor = cnx.cursor()
        sql = "SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo ORDER BY id"
        cursor.execute(sql)
        #Devuelve una lista de tuplas
        celulares = cursor.fetchall()
        columnas = tuple(nombre[0] for nombre in cursor.description)
        datos=[]
        for celular in celulares:       
            datos.append(Celular(columnas, celular).diccionario())          
        cursor.close()
        cnx.close()
        #En caso de error se controla desde JS
        return jsonify(datos)

@app.route("/agregar", methods=["POST"])
def agregar():
    try:
        imagen = request.files["imagen_modelo"]
        nombre_img = imagen.filename
        nombre_modelo = request.form["nombre_modelo"]
        tipo_celular = request.form["tipo_celular"]
        codigo_modelo = request.form["codigo_modelo"]
        marca = request.form["marca"]
        valor_unitario = round(float(request.form["valor_unitario"].split("$")[1].replace(".", "").replace(",", ".")), 2)
        cantidad = int(request.form["cantidad"])
        camara_principal = request.form["camara_principal"]
        camara_frontal = request.form["camara_frontal"]
        flash_celular = request.form["flash"]
        memoria_rom = request.form["memoria_interna_rom"]
        memoria_ram = request.form["memoria_ram"]
        tamanio_pantalla = request.form["tamanio_pantalla"]
        pantalla_tipo = request.form["pantalla_tipo"]
        pantalla_resolucion = request.form["pantalla_resolucion"]
        tipo_de_red = request.form["tipo_de_red"]
        wifi = request.form["wifi"]
        usb = request.form["puerto_micro_usb"]
        gps = request.form["gps"]
        nfc = request.form["nfc"]
        bt = request.form["bt"]
        sist_op = request.form["sistema_operativo"]
        procesador = request.form["procesador"]
        color = request.form["color"]
        bateria = request.form["bateria"]
        dimensiones = request.form["dimensiones"]
        peso = request.form["peso"]
    except ValueError:
        flash(f'Los datos ingresados no son válidos', 'error')
        return redirect(url_for('admin'))
    except:
        flash(f'Ocurrio un error', 'error')
        return redirect(url_for('admin'))
    try:
        cnx = conectar()
        cursor = cnx.cursor()
        cursor.execute("SELECT codigo_modelo FROM stock")
        cods = cursor.fetchall()
        for cod in cods:
            if codigo_modelo == cod[0]:
                flash('Ya existe un producto con ese código', 'error')
                cursor.close()
                cnx.close()
                return redirect(url_for('admin'))
        #Verifico si se seleccionó una imagen, sino devuelve error
        if nombre_img == '':
            flash('No se ha seleccionado ningún archivo', 'error')
            cursor.close()
            cnx.close()            
            return redirect(url_for('admin'))
        extension = nombre_img.rsplit('.', 1)[1].lower()
        if imagen and ('.' in nombre_img and extension in ext_permitidas):
            nombre_img = secure_filename(f"{codigo_modelo}.webp")
            cursor.execute(f'INSERT INTO especificacion(codigo_modelo, camara_principal, camara_frontal, flash, memoria_interna_rom, memoria_ram, tamanio_pantalla, pantalla_tipo, pantalla_resolucion, tipo_de_red, wi_fi, puerto_micro_usb, gps, nfc, bluetooth, sistema_operativo, procesador, color, bateria, dimensiones, peso) VALUES("{codigo_modelo}", "{camara_principal}", "{camara_frontal}", "{flash_celular}","{memoria_rom}","{memoria_ram}", "{tamanio_pantalla}", "{tipo_celular}", "{pantalla_resolucion}", "{tipo_de_red}", "{wifi}", "{usb}", "{gps}", "{nfc}","{bt}", "{sist_op}", "{procesador}", "{color}", "{bateria}", "{dimensiones}", "{peso}")')

            cursor.execute(f'INSERT INTO stock(imagen_modelo, nombre_modelo, tipo_celular, codigo_modelo, marca, valor_unitario,cantidad) VALUES("{nombre_img}", "{nombre_modelo}","{tipo_celular}","{codigo_modelo}","{marca}","{valor_unitario}",{cantidad})')
            
        elif not (extension in ext_permitidas):
            flash(f'No se admiten archivos de extensión {extension}', 'error')
            cursor.close()
            cnx.close()   
            return redirect(url_for('admin'))
        else:
            flash('Archivo no válido', 'error')
            cursor.close()
            cnx.close()   
            return redirect(url_for('admin'))
    except:
        flash('Ocurrio un error al guardar los datos', 'error')
        cursor.close()
        cnx.close()   
        return redirect(url_for('admin'))
    else:
        try:
            #Si el insert se realizó correctamente, intento guardar la imagen
            imagen.save(os.path.join(app.config['UPLOAD_FOLDER'], nombre_img))
            error = modificar(nombre_img)
            if error:
                os.remove(f"{carpeta}/{nombre_img}")
                raise Exception("Error al guardar la imagen")
        except:
            cursor.close()
            cnx.close()   
            flash('Ha ocurrido un error al guardar la imagen.', 'error')
            return redirect(url_for('admin'))
        else:
            cnx.commit()
            ordenar_id(cnx)
            cursor.close()
            cnx.close() 
            flash(f'Datos guardados correctamente', 'exito')
            return redirect(url_for('admin')) 

@app.route("/editar", methods=["POST"])
def editar():
    try:
        id = request.form["id"]
        imagen = request.files["imagen_modelo"]
        nombre_img = imagen.filename
        nombre_modelo = request.form["nombre_modelo"]
        tipo_celular = request.form["tipo_celular"]
        codigo_modelo = request.form["codigo_modelo"]
        marca = request.form["marca"]
        valor_unitario = round(float(request.form["valor_unitario"].split("$")[1].replace(".", "").replace(",", ".")), 2)
        cantidad = int(request.form["cantidad"])
        camara_principal = request.form["camara_principal"]
        camara_frontal = request.form["camara_frontal"]
        flash_celular = request.form["flash"]
        memoria_rom = request.form["memoria_interna_rom"]
        memoria_ram = request.form["memoria_ram"]
        tamanio_pantalla = request.form["tamanio_pantalla"]
        pantalla_tipo = request.form["pantalla_tipo"]
        pantalla_resolucion = request.form["pantalla_resolucion"]
        tipo_de_red = request.form["tipo_de_red"]
        wifi = request.form["wifi"]
        usb = request.form["puerto_micro_usb"]
        gps = request.form["gps"]
        nfc = request.form["nfc"]
        bt = request.form["bt"]
        sist_op = request.form["sistema_operativo"]
        procesador = request.form["procesador"]
        color = request.form["color"]
        bateria = request.form["bateria"]
        dimensiones = request.form["dimensiones"]
        peso = request.form["peso"]
    except ValueError:
        flash('Los datos ingresados no son válidos', 'error')
        return redirect(url_for('admin'))
    except:
        flash('Ocurrio un error', 'error')
        return redirect(url_for('admin'))
    try:
        cnx = conectar()
        cursor = cnx.cursor()
        #Si el codigo cambió, verifico si es igual a otro de la base de datos
        cursor.execute(f"SELECT codigo_modelo FROM stock WHERE id LIKE {id}")
        code = cursor.fetchone()
        if(code[0] != codigo_modelo):
            cursor.execute(f"SELECT codigo_modelo FROM stock WHERE id NOT LIKE {id}")
            codes = cursor.fetchall()
            for code in codes:
                if code[0] == codigo_modelo:
                    flash('El codigo ingresado pertenece a otro producto', 'error')
                    cursor.close()
                    cnx.close() 
                    return redirect(url_for('admin')) 
        if nombre_img == '':
            cursor.execute('ALTER TABLE stock DROP FOREIGN KEY fstock')
            cursor.execute(f'UPDATE stock JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo SET stock.nombre_modelo = "{nombre_modelo}", stock.tipo_celular = "{tipo_celular}", stock.codigo_modelo = "{codigo_modelo}", especificacion.codigo_modelo = "{codigo_modelo}", stock.marca = "{marca}", stock.valor_unitario = "{valor_unitario}", stock.cantidad = {cantidad}, especificacion.camara_principal = "{camara_principal}", especificacion.camara_frontal = "{camara_frontal}", especificacion.flash = "{flash_celular}", especificacion.memoria_interna_rom = "{memoria_rom}", especificacion.memoria_ram = "{memoria_ram}", especificacion.tamanio_pantalla = "{tamanio_pantalla}", especificacion.pantalla_tipo = "{pantalla_tipo}", especificacion.pantalla_resolucion =  "{pantalla_resolucion}", especificacion.tipo_de_red = "{tipo_de_red}", especificacion.wi_fi = "{wifi}", especificacion.puerto_micro_usb = "{usb}", especificacion.gps = "{gps}", especificacion.nfc = "{nfc}", especificacion.bluetooth = "{bt}", especificacion.sistema_operativo = "{sist_op}", especificacion.procesador = "{procesador}", especificacion.dimensiones = "{dimensiones}", especificacion.color = "{color}", especificacion.bateria = "{bateria}", especificacion.peso = "{peso}" WHERE stock.id = {id}')
            cursor.execute('ALTER TABLE stock ADD CONSTRAINT `fstock` FOREIGN KEY (codigo_modelo) REFERENCES especificacion(codigo_modelo)')

        elif imagen and ('.' in nombre_img):
            extension = nombre_img.rsplit('.', 1)[1].lower()
            if extension in ext_permitidas:
                cursor.execute(f'SELECT imagen_modelo FROM stock WHERE id = {id}')
                img_anterior = cursor.fetchone()[0]
                nombre_img = secure_filename(f"{codigo_modelo}.webp")
                cursor.execute('ALTER TABLE stock DROP FOREIGN KEY fstock')
                cursor.execute(f'UPDATE stock JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo SET stock.imagen_modelo = "{nombre_img}", stock.nombre_modelo = "{nombre_modelo}", stock.tipo_celular = "{tipo_celular}", stock.codigo_modelo = "{codigo_modelo}", especificacion.codigo_modelo = "{codigo_modelo}", stock.marca = "{marca}", stock.valor_unitario = "{valor_unitario}", stock.cantidad = {cantidad}, especificacion.camara_principal = "{camara_principal}", especificacion.camara_frontal = "{camara_frontal}", especificacion.flash = "{flash_celular}", especificacion.memoria_interna_rom = "{memoria_rom}", especificacion.memoria_ram = "{memoria_ram}", especificacion.tamanio_pantalla = "{tamanio_pantalla}", especificacion.pantalla_tipo = "{pantalla_tipo}", especificacion.pantalla_resolucion =  "{pantalla_resolucion}", especificacion.tipo_de_red = "{tipo_de_red}", especificacion.wi_fi = "{wifi}", especificacion.puerto_micro_usb = "{usb}", especificacion.gps = "{gps}", especificacion.nfc = "{nfc}", especificacion.bluetooth = "{bt}", especificacion.sistema_operativo = "{sist_op}", especificacion.procesador = "{procesador}", especificacion.dimensiones = "{dimensiones}", especificacion.color = "{color}", especificacion.bateria = "{bateria}", especificacion.peso = "{peso}" WHERE stock.id = {id}')
                cursor.execute('ALTER TABLE stock ADD CONSTRAINT `fstock` FOREIGN KEY (codigo_modelo) REFERENCES especificacion(codigo_modelo)')

                try:
                    try:
                        os.remove(f"{carpeta}/{img_anterior}")
                    except:
                        pass
                    imagen.save(os.path.join(app.config['UPLOAD_FOLDER'], nombre_img))
                    error = modificar(nombre_img)
                    if error:
                        os.remove(f"{carpeta}/{nombre_img}")
                        raise Exception("Error al guardar la imagen")
                except:
                    cursor.close()
                    cnx.close()   
                    flash('Ha ocurrido un error al guardar la imagen.', 'error')
                    return redirect(url_for('admin'))
                
            else:
                flash(f'No se admiten archivos de extensión {extension}', 'error')
                cursor.close()
                cnx.close()   
                return redirect(url_for('admin'))
        else:
            flash('Archivo no válido', 'error')
            cursor.close()
            cnx.close()   
            return redirect(url_for('admin'))
            
    except:
        flash('Ocurrio un error al guardar los datos', 'error')
        cursor.close()
        cnx.close()   
        return redirect(url_for('admin'))


    cnx.commit()
    cursor.close()
    cnx.close() 
    flash(f'Datos modificados correctamente', 'exito')
    return redirect(url_for('admin')) 
    


@app.route("/borrar", methods=['DELETE'])
def borrar():
    try:
        codigo = request.json['codigo']
        ruta_img = request.json['imagen']
        cnx = conectar()
        cursor = cnx.cursor()
        cursor.execute('ALTER TABLE stock DROP FOREIGN KEY fstock')
        cursor.execute(f"DELETE stock, especificacion FROM stock JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo WHERE stock.codigo_modelo LIKE '{codigo}' OR especificacion.codigo_modelo LIKE '{codigo}'")
        cursor.execute('ALTER TABLE stock ADD CONSTRAINT `fstock` FOREIGN KEY (codigo_modelo) REFERENCES especificacion(codigo_modelo)')
         
    except Exception as error:
            cursor.close()
            cnx.close()
            return jsonify({'error': True, 'mensaje': f'Se ha producido un error'})
    else:
        try:
            os.remove(f"{carpeta}/{ruta_img}")
            cnx.commit()
            ordenar_id(cnx)
            cursor.close()
            cnx.close()
            return jsonify({'error': False, 'mensaje': 'Producto eliminado correctamente'})
        except:
            return jsonify({'error': True, 'mensaje': f'Se ha producido un error al borrar la imagen'})





# @app.route("/api/<id>", methods = ['GET'])
# def get_id(id):
#     cnx = conectar()
#     cursor = cnx.cursor()
#     cursor.execute(f"SELECT * FROM stock WHERE id = {id}")

#     #Devuelve una lista de tuplas
#     resultado = cursor.fetchall()
#     datos = []
#     for stock in resultado:
#         dato = {'id': stock[0], 
#                 'imagen': stock[1]}
#         datos.append(dato)
#     return jsonify(datos)



if __name__ == "__main__":
    app.run(debug=True)
