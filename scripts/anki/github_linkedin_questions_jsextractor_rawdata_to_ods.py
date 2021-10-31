from pyexcel_ods import save_data
from collections import OrderedDict
import clipboard
import re
from functools import partial

f = open("data.txt", mode='r')
questions = f.read()
f.close()
questions = questions.split("____----")
data = []

for q in questions :
    if q :
        l = q.split("----____")        
        l = [ l[0] , "".join(l[1:]) ]
        data += [l]
sheet = OrderedDict()
sheet.update({"Sheet 1": data})
save_data("data.ods", data)