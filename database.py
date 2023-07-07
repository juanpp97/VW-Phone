import mysql.connector
def conectar():
    db = mysql.connector.connect(
        host='localhost',
        user='root',
        password ='juanp1997',
        database='tienda'
    )
    return db
def cerrar(cursor, db):
    cursor.close()
    db.close()