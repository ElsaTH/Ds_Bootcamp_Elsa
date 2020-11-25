import pandas as pd
import os.path, sys




def clean_df(path=None):
    
    # Introducimos los datos del archivo en una variable común.
    path = os.path.abspath(input("Copie y pegue la dirección url o el path del archivo csv a importar: "))
    # Creamos el dataframe
    df = pd.read_csv(path)
    # Eliminar todas las columnas con un solo valor, o con más de un 50% de valores faltantes, esto lo hacemos para trabajar más rápido.absDetermine si la              fila o columna se elimina de DataFrame, cuando tenemos al menos un NA o todos los NA.
    #Parámetros: 'all': si todos los valores son NA, elimine esa fila o columna.
    df.dropna(axis=0, how='all', inplace=True)
    # Eliminar duplicados
    df.drop_duplicates(keep=False, inplace=False)
    # Si hay pocos Nan y la columna puede servir podemos cambiar Nan por O
    df.fillna(0, inplace=True)
    print(df.keys())


    return df

clean_df()