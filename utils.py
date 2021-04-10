import os
import json
from bs4 import BeautifulSoup

cache_dir = "templates/snippets/"

# tag mapper
with open("map_tags.json","r") as f:
    tag_mapper = json.load(f)


def loadfile():
    if os.path.exists("final.html"):
        with open("final.html","r") as f:
            return f.read()
    

def savefile(data):
    with open("final.html","w+") as f:
        f.write(str(data))

def getitem(speech,command,data):
    parse_count = 0
    no_check = 0

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
                with open(cache_dir+item,"r") as f:
                    tag = BeautifulSoup(f.read(),features="html.parser")
                    no_check = 1
                break

    speech =speech[parse_count:].split()

    try:
        if not no_check:
            check_content = speech.index("content")
            tag.string = speech[check_content+1]
            check_class = speech.index("class")
            class_ = speech[check_class+2]
            tag['class']  = class_ 
    except ValueError:
        pass

    data.body.append(tag)
    savefile(data)