from bs4 import BeautifulSoup
from utils import *
from recognise import mic


def process_speech(speech,data):
    for command in commands:
        if command in speech:
            return commands[command](speech,command,data)

commands = {
    "save":savefile,
    "image":add_asset,
    "database":db_make,
    "add":getitem,
    "create":getitem,
    "background":bg,
    "move":moveitem,
    "response":resp

}


def main_loop():

    # load file
    if data:= loadfile():
        data = BeautifulSoup(data,features="html.parser")
    else:
        with open("templates/base.html","r") as f:
            data = BeautifulSoup(f.read(),features="html.parser")
        with open("main.css","w") as f:
            f.write("")

    while True:

        # Getting text
        for i in range(3):
            response = mic.recognize_speech()
            if response["success"]:
                speech = response["transcription"]
                break
        else:
            print("Too many errors stopping")

        print("you said:",speech)
        if speech:
            if "exit" == speech:
                break
            data = process_speech(speech,data)
        else:
            print("retry")
        
        
if __name__ == "__main__":
    main_loop()