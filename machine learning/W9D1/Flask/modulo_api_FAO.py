import pandas as pd
import numpy
import requests
import json
                                                                    # @Elsa TH



def fao1 (df):
   """ 
   Devuelve primer json
   """
   df = pd.read_csv("FAO.csv",encoding="ISO-8859-1")
   df = df.loc[:,['Area', 'Item', 'Element', 'Unit', 'latitude', 'longitude', 'Y1961',
       'Y1962', 'Y1963', 'Y1964', 'Y1965', 'Y1966', 'Y1967', 'Y1968', 'Y1969',
       'Y1970', 'Y1971', 'Y1972', 'Y1973', 'Y1974', 'Y1975', 'Y1976', 'Y1977',
       'Y1978', 'Y1979', 'Y1980', 'Y1981', 'Y1982', 'Y1983', 'Y1984', 'Y1985',
       'Y1986', 'Y1987', 'Y1988', 'Y1989', 'Y1990', 'Y1991', 'Y1992', 'Y1993',
       'Y1994', 'Y1995', 'Y1996', 'Y1997', 'Y1998', 'Y1999', 'Y2000', 'Y2001',
       'Y2002', 'Y2003', 'Y2004', 'Y2005', 'Y2006', 'Y2007', 'Y2008', 'Y2009',
       'Y2010', 'Y2011', 'Y2012', 'Y2013']]
   Spain_food = df.loc[:,['Area', 'Item','Y2007', "Y2008",'Y2012']]
   Spain_food = Spain_food[Spain_food.Area == 'Spain']
   Spain_produ = Spain_food.groupby(["Item"], as_index=False)['Y2007', "Y2008",'Y2012'].sum()
    
   return Spain_produ.to_json("Spain_production.json")


def fao2 (df2):
   """ 
   Devuelve segundo json
   """
   df2 = pd.read_csv("Production_Crops_E_All_Data_(Normalized).csv",encoding="ISO-8859-1",date_parser="Year")
   df2 = df2.loc[:,["Area", "Item", "Element", "Year", "Unit", "Value"]]
   Spain_production2 = df2[df2.Area == 'Spain'] 
   Spain_production2 = Spain_production2[Spain_production2.Element == "Production"]
   return Spain_production2.to_json("Spain_production2.json")




def fao3 (df3):
   """ 
   Devuelve tercer json
   """
   df3 = pd.read_csv("FAOSTAT_data_8-10-2020.csv",encoding="ISO-8859-1",date_parser="Year") 
   Spain_price = df3.loc[:,["Area","Item","Year","Value"]]
   return Spain_price.to_json("Spain_price.json")


def fao4 (df4):
   """ 
   Devuelve cuarto json
   """
   df4 = pd.read_csv("FAOSTAT_Production_Indices_8-10-2020.csv",encoding="ISO-8859-1",date_parser="Year")  
   Spain_price2 = df4.loc[:,["Area", "Item", "Year", "Value"]]
   return Spain_price2.to_json("Spain_price2.json")