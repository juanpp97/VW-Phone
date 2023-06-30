import mysql.connector
def conectar():
    db = mysql.connector.connect(
        host='localhost',
        user='root',
        password ='juanp1997',
        database='tienda'
        # host='juanpe.mysql.pythonanywhere-services.com',
        # user='juanpe',
        # password ='juanp1997',
        # database='juanpe$prueba'
    )
    return db
def cerrar(cursor, db):
    cursor.close()
    db.close()