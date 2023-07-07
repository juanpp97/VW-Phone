import os
from PIL import Image
ruta = "img/"
files = os.listdir(ruta)
extensions = ['jpg']
for file in files:
    ext = file.split(".")[-1]
    if ext in extensions:
        image = Image.open(ruta + file)
        im_resized = image.resize((250,250))
        nombre = file.split(".")[0]
        filepath = f"{ruta}{nombre}.webp"
        im_resized.save(filepath)
        os.remove(ruta + file)
