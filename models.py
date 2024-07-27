from peewee import *
from decouple import config
from werkzeug.security import generate_password_hash, check_password_hash
from exceptions import ModelException
mysql_db = MySQLDatabase('tienda_celulares', 
                         user=config('DATABASE_USER'), 
                         password=config('DATABASE_PASSWORD'),
                         host=config('DATABASE_HOST'), 
                         port=3306)

class BaseModel(Model):
    class Meta:
        database = mysql_db
        
    
class User(BaseModel):
    
    username = CharField(max_length=50, unique = True, null=False)
    email = CharField(max_length=100, unique = True, null=False)
    _password = CharField(max_length=50, null=False)
    is_admin = BooleanField(default=False)
    
    def set_password(self, password):
        self._password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self._password, password)
    
    def save(self, force_insert=False, only=None):
        if not self.username:
            raise ModelException("El usuario es obligatorio")
        if not self._password:
            raise ModelException("La contraseña es obligatoria")
        if not self.email:
            raise ModelException("El email es obligatorio")

        return super().save(force_insert, only)

class Marca(BaseModel):
    nombre = CharField(max_length=50, unique=True, null=False)
    
class Celular(BaseModel):
    nombre_modelo = CharField(max_length=100, null=False)
    codigo_modelo = CharField(max_length=20, null=True)
    precio_unitario = IntegerField(null=False)
    marca = ForeignKeyField(Marca, backref="celular", on_delete="CASCADE")
    imagen = CharField()
    camara = CharField()
    memoria = CharField()
    pantalla = CharField() 
    conectividad = CharField()
    os =  CharField()
    procesador = CharField()
    bateria = CharField()
    dimensiones_peso = CharField()
    color = CharField()
    extras = TextField()
    
class Stock(Celular, BaseModel):
    cantidad = IntegerField(null=False)

    

mysql_db.connect()
mysql_db.create_tables([User, Marca, Stock])
 
# try:
#     user = User(username = "Juan", is_admin = True)
#     user.set_password("blender123")
#     user.save()
# except BaseException as e:
#     print(e)
# marca =  Marca("Apple")
# marca.save()
# Stock(nombre_modelo = "iPhone 13", codigo_modelo = "123456", precio_unitario = 10000, marca = marca, cantidad = 10).save()
mysql_db.close()