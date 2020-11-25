import os, sys
from flask import Flask, render_template, redirect, request, jsonify 
import json
import pandas as pd                                                                 #@Elsa TH
from modulo_api_FAO import fao1,fao2,fao3,fao4

# Creamos la api:

app = Flask(__name__)  

@app.route("/")  
def default():

    return "<h1></b> API PROYECTO INDIVIDUAL</b></h1>    <h1>Para obtener DataFrame: </h1> <ul><li> <h2>Primer json: Spain_production </h2>      <h3>/get_data/?id= Spain_production </h3>   <li> <h2>Segundo json: Spain_production2 </h2>    <h3>/get_data/?id= Spain_production2 </h3>     <li> <h2>Tercer json: Spain_price </h2>      <h3>/get_data/?id= Spain_price </h3>   <li> <h2>Cuarto json: Spain_price2</h2>    <h3>/get_data/?id= Spain_price2 </h3></ul>"

 

# Creamos la función GET
@app.route('/get_data/', methods=['GET'])

def api_all():
    x = request.args['id']
# Retorna el primer json
    if x == "Spain_production":
        data = pd.read_json( "/Users/Elsa/Desktop/Covid_Agosto/Proyecto_Elsa/Proyecto_individual_Elsa/src/api_FAO/Spain_production.json")
        return data.to_json()
# Retorna el segundo json
    if x == "Spain_production2":
        data = pd.read_json( "/Users/Elsa/Desktop/Covid_Agosto/Proyecto_Elsa/Proyecto_individual_Elsa/src/api_FAO/Spain_production2.json")
        return data.to_json()
# Retorna el tercer json
    if x == "Spain_price":
        data = pd.read_json( "/Users/Elsa/Desktop/Covid_Agosto/Proyecto_Elsa/Proyecto_individual_Elsa/src/api_FAO/Spain_price.json")
        return data.to_json()
# Retorna el cuarto json
    if x == "Spain_price2":
        data = pd.read_json( "/Users/Elsa/Desktop/Covid_Agosto/Proyecto_Elsa/Proyecto_individual_Elsa/src/api_FAO/Spain_price2.json")
        return data.to_json()


    else:
        return "<h1></b> This is a message of error. Try again.</b></h1>"





def main():

    print("STARTING PROCESS")
    print(os.path.dirname(__file__))
    
    # Get the settings fullpath
    settings_file = os.path.dirname(__file__) + "/settings.json"
    # Load json from file 
    with open(settings_file, "r") as json_file_readed:
        json_readed = json.load(json_file_readed)
    
    # Load variables from jsons
    SERVER_RUNNING = json_readed["server_running"]
    
    if SERVER_RUNNING:
        DEBUG = json_readed["debug"]
        HOST = json_readed["host"]
        PORT_NUM = json_readed["port"]
        app.run(debug=DEBUG, host=HOST, port=PORT_NUM)
    else:
        print("Server settings.json doesn't allow to start server. " + 
              "Please, allow it to run it.")
            
if __name__ == "__main__":
    main()