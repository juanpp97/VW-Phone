class Celular:
    def __init__(self, nombres:tuple, valores:tuple):
        self.nombres = nombres
        self.valores = valores
    @staticmethod
    def formato(precio):
        precio,decimal=precio.split(".")
        precio_str = ""
        longitud = len(precio)
        for i in range(longitud):
            precio_str += precio[i]
            if (longitud - i - 1) % 3 == 0 and i != longitud - 1:
                    precio_str += "."
        return "$" + precio_str + "," + decimal
    def diccionario(self):
        datos = {}
        for indice, clave in enumerate(self.nombres):
            if clave == 'valor_unitario':
                datos[clave] = self.formato(str(self.valores[indice]))
            else:
                datos[clave] = self.valores[indice]
        return datos
              
              
         
