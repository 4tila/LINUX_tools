from pyfzf.pyfzf import FzfPrompt
from datetime import datetime, timedelta, date
from json import load, dump
SCRIPT="~/Desktop/script/"
with open(SCRIPT+'dates.json', 'r') as f: dates = load(f)
x=input('Do you wish to add or delete event (y/n)\n>: ').lower()
if x=='y':
    x = input('Do you wish to delete one(y/n)?\n>: ').lower()
    if x=='y':
        fzf = FzfPrompt()
        name = fzf.prompt(sorted(list(dates.keys())))[0]
        del dates[name]
    else:
        y=input('Name of event to be added\n>: ').lower()
        z=input('Date in iso format yyyy-mm-dd\n>: ').lower() 
        dates[y]=z
    with open(SCRIPT+'dates.json', 'w+') as f: dump(dates, f, indent=4)
now = datetime.now()
keys = list(dates.keys())
dates = {k:date.fromisoformat(dates[k]) for k in keys}
dates = {k:datetime.fromordinal(dates[k].toordinal()) for k in keys}
dates = {k:dates[k]-now for k in keys}
dates = sorted([(dates[k], k) for k in dates])
for d in dates:
    print(d[1]+ ' --- '+str(d[0]))


