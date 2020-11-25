from functools import wraps
from datetime import datetime
import math
import time
import pandas as pd
import matplotlib.pyplot as plt



def prepost(*arg, url):
    def inner(funtion):
        @wraps(funtion)
        def wrapper(*a, **k):
            if url:
                df= pd.read_csv(url, sep=",")
            retval = funtion(*a, **k)
            df.plot(kind="hist", color="m")
            plt.title("Winter olympics medals")
            plt.show()
            return retval
        return wrapper
    return inner
   
@prepost(url="http://winterolympicsmedals.com/medals.csv")   
def _f_protected():
    
    l1 = [ x for x in range(0,16) ] 
    list(filter(lambda x: (x> 5) , l1))  
    return

funtion = _f_protected()

