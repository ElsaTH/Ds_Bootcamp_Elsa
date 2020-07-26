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

def __get_root_project(number_of_descent): 
"""
Accedemos a la ruta de fichero raiz

"""

    # For .py files
    #__file = __file__ 
    # For .ipynb files
    __file = os.getcwd()
    for _ in range(number_of_descent):
        __file = os.path.dirname(__file)
    sys.path.append(__file)                 # si sacamos fuera del for el append sólo lo incluye una vez, sino incluye todas las líneas
    sys.path = list(set(sys.path))

__get_root_project(number_of_descent=4)     # El 4 es la cantidad de carpetas que tiene que subir




def gender_to_numeric(x):
    """
    Muy útil para hacer cálculos numéricos como ratio donde existan dos variables, hombre - mujer
    """
    if x == 'M':
        return 1
    if x == 'F':
        return 0


def show_html(html_str):
    """
    web scraping, método que forma la lista de una manera mas leible
    Importante importar libreria BeautifulSoup
    """
    print(BeautifulSoup(str(html_str), 'html.parser').prettify())