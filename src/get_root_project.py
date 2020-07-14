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