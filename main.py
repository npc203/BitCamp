import speech_recognition as sr
from bs4 import BeautifulSoup
import time,os

r = sr.Recognizer()
mic = sr.Microphone()

if data:= loadfile():
    data = BeautifulSoup(data,features="html.parser")
else:
    with open("templates/base.html","r") as f:
        data = BeautifulSoup(f.read(),features="html.parser")

while True:
    pass
    

def loadfile():
    if os.path.exists("final.html"):
        with open("final.html","r") as f:
            return f.read()
    

def savefile(data):
    with open("final.html","w+") as f:
        f.write(str(data))