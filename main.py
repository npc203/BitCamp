import speech_recognition as sr
from bs4 import BeautifulSoup
from utils import loadfile, savefile, getitem,moveitem



def process_speech(speech,data):
    for command in commands:
        if command in speech:
            commands[command](speech,command,data)

commands = {
    "save":savefile,
    "add":getitem,
    "create":getitem,
    "move":moveitem
}


def main_loop():

    # load file
    if data:= loadfile():
        data = BeautifulSoup(data,features="html.parser")
    else:
        with open("templates/base.html","r") as f:
            data = BeautifulSoup(f.read(),features="html.parser")
        with open("main.css","w") as f:
            f.write("Sample css")

    r = sr.Recognizer()
    mic = sr.Microphone()

    while True:
        print("listening")
        with mic as source:
            # r.adjust_for_ambient_noise(source)
            audio = r.listen(source)
        print("recognising")
        speech = r.recognize_google(audio)
        print("you said:",speech)
        if "exit" == speech:
            break
        data = process_speech(speech,data)
        
        
if __name__ == "__main__":
    main_loop()