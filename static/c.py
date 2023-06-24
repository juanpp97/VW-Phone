import os
from PIL import Image

files = os.listdir("img")
extensions = ['jpg']
for file in files:
    ext = file.split(".")[-1]
    if ext in extensions:
        image = Image.open("img/" + file)
        im_resized = image.resize((250,250))
        filepath = f"img/{file}.webp"
        im_resized.save(filepath)
