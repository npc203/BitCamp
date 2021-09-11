import os
import json
from bs4 import BeautifulSoup
from css_edits import *
import pyttsx3
from recognise import mic

cache_dir = "templates/snippets/"
tts = pyttsx3.init()
tts.setProperty("rate", 125)


def speak(text):
    tts.say(text)
    tts.runAndWait()


# tag mapper
with open("map_tags.json", "r") as f:
    tag_mapper = json.load(f)


def loadfile():
    if os.path.exists("final.html"):
        with open("final.html", "r") as f:
            return f.read()


def savefile(data):
    with open("final.html", "w+") as f:
        f.write(str(data))


def getitem(speech, command, data):
    parse_count = 0
    no_check = 0
    tag = None

    # default tags
    for item in tag_mapper:
        if item in speech:
            parse_count = speech.find(item)
            tag = data.new_tag(tag_mapper[item])
            break
    else:
        # snippets
        items = os.listdir(cache_dir)
        for item in items:
            tmp = item.split(".")[0]
            if tmp in speech:
                parse_count = speech.find(tmp)
                with open(cache_dir + item, "r") as f:
                    tag = BeautifulSoup(f.read(), features="html.parser")
                    no_check = 1
                break

    speech = speech[parse_count:].split()

    try:
        if not no_check:
            check_content = speech.index("content")
            tag.string = speech[check_content + 1]
            check_class = speech.index("class")
            class_ = speech[check_class + 2]
            tag["class"] = class_
    except ValueError:
        pass
    if data and tag:
        data.body.append(tag)
        savefile(data)
        speak("Sucessfully added to the html")
    else:
        print(data, "#############", tag)
        speak("Invalid command")
    return data


def add_asset(speech, command, data):
    items = os.listdir("assets/")
    speak("Paste your assets into the assets folder and speak out the file name")
    for i in range(3):
        response = mic.recognize_speech()
        if response["success"]:
            result = response["transcription"]
            print("you said", result)
            for img in items:
                if img.startswith("test"):
                    tag = data.new_tag("img", src=f"assets/{img}", height="10%", width="10%")
                    data.append(tag)
                    if data:
                        data.body.append(tag)
                        savefile(data)
                    return
        else:
            print("Retry...")


def moveitem(speech, command, data):
    # if "centre" in speech or "center" in speech:

    data = center()
    savecss(data)


def bg(speech, command, data):
    try:
        speech = speech.split()
        check_color = speech.index(command)
        savecss(background_css(speech[check_color + 2]))
        speak(f"Changed background to {speech[check_color + 2]}")
    except ValueError:
        pass


def db_make(speech, command, data):
    with open("templates/base.php", "r") as f:
        with open("main.php", "w") as fp:
            fp.write(f.read())


def savecss(data):
    with open("main.css", "a") as f:
        f.write(str(data))


def resp(speech, command, data):
    speak("Bootstrap has already been added")
