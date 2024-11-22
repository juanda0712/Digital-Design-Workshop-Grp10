# Crear el contenido para un archivo .mif basado en las instrucciones en formato hexadecimal

# Datos hexadecimales proporcionados por el usuario
hex_data = [
    "e3a00000", "e3a01802", "e3092c40", "e4d03001", "e4d04001", "e4d05001",
    "eb000005", "e4c16001", "e4c17001", "e4c18001", "e2522001", "1afffff6",
    "ea000007", "e3a09065", "e3a0a0c5", "e3a0b030", "e0060993", "e0266a94",
    "e0266b95", "e1a06426", "e12fff1e", "eafffffe", "e351004f", "0a00000d",
    "e3510055", "0a00000b", "e3510061", "0a000009", "e3510065", "0a000007",
    "e3510069", "0a000005", "e351006f", "0a000003", "e3510075", "0a000001",
    "e2800004", "eaffffe2", "e2833001", "e2800004", "eaffffdf", "e1a00002",
    "e5901000", "e0805008", "e3510000", "0a000024", "e3510020", "0a00001d",
    "e3510041", "0a000015", "e3510045", "0a000013", "e3510049", "0a000011",
    "e351004f", "0a00000f", "e3510055", "0a00000d", "e3510061", "0a00000b",
    "e3510065", "0a000009", "e3510069", "0a000007", "e351006f", "0a000005",
    "e3510075", "0a000003", "e0811007", "e5851000", "e2800004", "eaffffe1",
    "e5854000", "e2800004", "eaffffde", "e1530006", "0affffdb", "eaffffff",
    "e5851000", "e2800004"
]

# Configurar parámetros del archivo .mif
width = 32
depth = 128  # Ajustar el tamaño a un múltiplo de 2, suficiente para las instrucciones
address_radix = "UNS"
data_radix = "HEX"

# Generar contenido del .mif
mif_content = f"""-- Generated Memory Initialization File (.mif)
WIDTH={width};
DEPTH={depth};

ADDRESS_RADIX={address_radix};
DATA_RADIX={data_radix};

CONTENT BEGIN
"""

# Añadir las instrucciones con sus direcciones
for i, instruction in enumerate(hex_data):
    mif_content += f"\t{i} : {instruction.upper()};\n"

# Rellenar el resto de la memoria con ceros
if len(hex_data) < depth:
    mif_content += f"\t[{len(hex_data)}..{depth-1}] : 00000000;\n"

mif_content += "END;"

# Guardar el contenido en un archivo .mif
output_path = "program.mif"
with open(output_path, "w") as mif_file:
    mif_file.write(mif_content)

output_path
