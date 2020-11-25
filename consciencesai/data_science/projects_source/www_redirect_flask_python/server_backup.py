import os, sys
#import urllib.request
from flask import Flask, render_template, redirect, request
from thread import execute_asynchronous_thread
from multiprocessing import Process
import json_reader as jr 
import time

app = Flask(__name__)

@app.route("/")
def main():
    #return render_template()
    # Redirect
    return redirect("http://aiconscience.ddns.net", code=302)

def shutdown_server():
    global SERVER_RUNNING
    SERVER_RUNNING = False
    func = request.environ.get('werkzeug.server.shutdown')
    if func is None:
        raise RuntimeError('Not running with the Werkzeug Server')
    func()
    sys.exit()
    exit()
    quit()

@app.route('/shutdown', methods=['POST'])
def shutdown():
    shutdown_server()
    return 'Server shutting down...'

def input_while():
    global INPUT_VALUE, SERVER
    while True:
        INPUT_VALUE = input()
        if INPUT_VALUE.upper() == "STOP":
            #request.post('http://localhost:5000/shutdown')
            SERVER.terminate()
            SERVER.join()

def check_settings_asynchronous():
    global SERVER_RUNNING
    while True:
        print("Readed")
        try:
            json_readed = jr.read_json_to_dict(json_fullpath=SETTING_PATH)
            if json_readed["server_running"] == False:
                #stop_server()
                SERVER_RUNNING = False
                break
        except Exception as error:
            pnt(error)
        #print("\n\n\n",json_readed)
        
        time.sleep(1)
    request.post('http://localhost:5000/shutdown')
    sys.exit()
    exit()
    quit()
    raise ValueError("Stop Server")
    

class Settings:
    def stop_server(self):
        self.server_running = False
        
    def start_server(self):
        self.server_running = True

def start_server():
    global SERVER, SERVER_RUNNING
    SERVER_RUNNING = True
    #SETTINGS.start_server()
    #json_string = jr.class_properties(object=SETTINGS)
    #jr.write_string_to_pathfile(string=json_string, filepath=SETTING_PATH)
    
def stop_server():
    global SETTINGS
    SETTINGS.stop_server()

def pnt(x):
    separator = "*********************"
    print(separator +"\n", str(x), "\n" + separator + "\n")

if __name__ == "__main__":
    print()
    SERVER_RUNNING = False
    INPUT_VALUE = ""
    PORT = int(os.environ.get('PORT', 5000))
    CURRENT_PATH = os.path.dirname(os.path.abspath(__file__))  # This doesn't work in jupyter
    SETTING_PATH = CURRENT_PATH + "\\settings.json"
    pnt(SETTING_PATH)
    
    json_readed = jr.read_json_to_dict(json_fullpath=SETTING_PATH)
    if json_readed["server_running"] == True:
        SERVER = Process(target=app.run(debug=True, host="0.0.0.0", port=PORT))
        SERVER.start()
        SERVER.terminate()
        SERVER.join()
        print("1")
        #SETTINGS = Settings()    
        SERVER_STATUS = True
        #execute_asynchronous_thread(check_settings_asynchronous)
        start_server()  
        print("2")
        check_settings_asynchronous()
        print("3")
        while True:
            if SERVER_RUNNING == False:
                SERVER.terminate()
                SERVER.join()
                pnt("Server off")
                raise ValueError("Stop Server")
                break
            time.sleep(1)
        sys.exit()
        exit()
        quit()
    else:
        pnt("Server settings.json doesn't allow to start server. Please, allow it to run it.")
    