from PIL import Image

def hex_to_rgb(hex_str):
    """Convierte una cadena hexadecimal en una tupla (R, G, B)."""
    r = int(hex_str[0:2], 16)
    g = int(hex_str[2:4], 16)
    b = int(hex_str[4:6], 16)
    return (r, g, b)

def apply_sepia(r, g, b):
    """Aplica el filtro sepia a un color RGB."""
    tr = int(0.393 * r + 0.769 * g + 0.189 * b)
    tg = int(0.349 * r + 0.686 * g + 0.168 * b)
    tb = int(0.272 * r + 0.534 * g + 0.131 * b)

    tr = min(255, max(0, tr))
    tg = min(255, max(0, tg))
    tb = min(255, max(0, tb))

    return (tr, tg, tb)

def read_hex_file(filename):
    """Lee un archivo .hex y devuelve una lista de tuplas RGB."""
    with open(filename, 'r') as f:
        lines = f.readlines()
    
    pixels = []
    for line in lines:
        line = line.strip()  # Eliminar espacios y saltos de línea
        if len(line) == 6:  # Asegurarse de que es un valor válido
            rgb = hex_to_rgb(line)
            pixels.append(rgb)
    
    return pixels

def save_as_png(pixels, width, height, output_filename):
    """Guarda la lista de píxeles como una imagen PNG."""
    # Crear una nueva imagen en modo RGB con las dimensiones especificadas
    img = Image.new('RGB', (width, height))

    # Establecer los píxeles en la imagen
    img.putdata(pixels)

    # Guardar la imagen como PNG
    img.save(output_filename)
    print(f"Imagen guardada como {output_filename}")

def apply_filter_and_save(input_filename, output_filename, width, height):
    """Lee el archivo .hex, aplica el filtro sepia y guarda la imagen como PNG."""
    pixels = read_hex_file(input_filename)
    
    # Aplicar filtro sepia a cada píxel
    sepia_pixels = [apply_sepia(r, g, b) for r, g, b in pixels]
    
    # Guardar como PNG
    save_as_png(sepia_pixels, width, height, output_filename)

def main():
    input_filename = 'imagen.hex'  # Ruta de tu archivo .hex de entrada
    output_filename = 'imagen_sepia.png'  # Ruta para el archivo de salida en PNG
    width = 640  # Ancho de la imagen (640 píxeles)
    height = 480  # Alto de la imagen (480 píxeles)
    
    # Aplicar filtro sepia y guardar la imagen como PNG
    apply_filter_and_save(input_filename, output_filename, width, height)

if __name__ == "__main__":
    main()
