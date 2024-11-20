from PIL import Image

image = Image.open('imagen.png')

if image.size != (200, 200):
    raise ValueError("La imagen debe ser de tamaño 200x200 píxeles")

# Convierte la imagen a RGB
image = image.convert('RGB')

# Obtén los valores RGB de la imagen
pixels = list(image.getdata())

r_values = []
g_values = []
b_values = []

# Separa los valores RGB en tres listas
for pixel in pixels:
    r, g, b = pixel
    r_values.append(r)
    g_values.append(g)
    b_values.append(b)

# Asegúrate de que las listas tengan 40,000 elementos
assert len(r_values) == len(g_values) == len(b_values) == 40000

# Crea una lista de 240,000 elementos llenada con ceros
all_values = [0] * 240000

# Llena los primeros 40,000 valores con los valores de R, los siguientes con G y los últimos con B
for i in range(40000):
    all_values[i] = r_values[i]
    all_values[40000 + i] = g_values[i]
    all_values[80000 + i] = b_values[i]

# Escribe los valores en un archivo .mif
with open('RAMem.mif', 'w') as f:
    f.write('WIDTH=8;\n')
    f.write('DEPTH=240000;\n')
    f.write('ADDRESS_RADIX=UNS;\n')
    f.write('DATA_RADIX=UNS;\n')
    f.write('CONTENT BEGIN\n')

    for idx, value in enumerate(all_values[:120000]):
        f.write(f"  {idx} : {value};\n")

    f.write("  [120000..239999] : 0;\n")

    f.write('END;\n')

print("Archivo .mif guardado como 'imagen.mif'")
