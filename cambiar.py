from PIL import Image
def modificar(nombre):
    ruta = "static/img/"
    try:
        image = Image.open(ruta + nombre)
        im_resized = image.resize((250,250))
        filepath = f"{ruta}/{nombre}"
        im_resized.save(filepath)
        return False
    except:
        return True

