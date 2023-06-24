from flask import Flask, render_template, request, jsonify
import database
import os

app = Flask(__name__)



@app.route("/")
def index():
    return render_template("index.html")

@app.route("/api")
def get_datos():
    cursor = database.db.cursor()
    sql = "SELECT * FROM stock INNER JOIN especificacion ON stock.codigo_modelo = especificacion.modelo"
    cursor.execute(sql)
    #Devuelve una lista de tuplas
    resultado = cursor.fetchall()
    datos = []
    for stock in resultado:
        dato = {'id': stock[0], 
                'imagen': stock[1], 
                'modelo': stock[2],
                'tipo': stock[3],
                'codigo': stock[4],
                'marca': stock[5],
                'precio': stock[6],
                'cantidad': stock[7]}
        datos.append(dato)
    return jsonify(datos)

@app.route("/api/<id>", methods = ['GET'])
def get_id(id):
    cursor = database.db.cursor()
    cursor.execute(f"SELECT * FROM stock WHERE id = {id}")

    #Devuelve una lista de tuplas
    resultado = cursor.fetchall()
    datos = []
    for stock in resultado:
        dato = {'id': stock[0], 
                'imagen': stock[1]}
        datos.append(dato)
    return jsonify(datos)



if __name__ == "__main__":
    app.run(debug=True)
