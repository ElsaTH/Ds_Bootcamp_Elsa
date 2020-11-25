def clean_strings(strings):
    """ 
    Eliminar espacios en blanco, eliminar símbolos de puntuación. 
    Usar métodos de cadena integrados:
    """
    result = []
    for value in strings:
        value = value.strip()
        value = re.sub('[!#?]', '', value)
        value = value.title()
        result.append(value)
    return result

def dtype():
    """
    Calcula tiempo que tarda tanto objetos con números
    """
    
    for dtype in ['object', 'int']:
    print("dtype =", dtype)
    %timeit np.arange(1E6, dtype=dtype).sum()
    print()    