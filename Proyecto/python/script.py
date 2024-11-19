from PIL import Image

# Abre la imagen
img = Image.open("image.jpeg")
#img = img.resize((200, 200))
img = img.convert("RGB")

with open("imagen.hex", "w") as hex_file:
    for y in range(img.height):
        for x in range(img.width):
            r, g, b = img.getpixel((x, y))
            hex_file.write(f"{r:02x}{g:02x}{b:02x}\n")
