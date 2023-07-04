from flask import Flask, render_template, request, jsonify, redirect
from database import conectar, cerrar
from celular import Celular
import os

app = Flask(__name__)



@app.route("/")
def index():
    return render_template("index.html")

@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/carrito")
def carrito():
    return render_template("carrito.html")
# @app.route("/carrito")
# def admin():
#     if select count == 0
#     redirect("/")
#     else
#     return render_template("carrito.html")

@app.route("/stock", methods=["GET", "POST"])
def obtener_datos():
    if request.method == "GET":
        cnx = conectar()
        cursor = cnx.cursor()
        sql = "SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.codigo_modelo"
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
    return redirect("/admin")
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
