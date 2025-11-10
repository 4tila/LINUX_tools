from pyfzf.pyfzf import FzfPrompt
from datetime import datetime, timedelta, date
from json import load, dump
import argparse
from prompt_toolkit import prompt

parser = argparse.ArgumentParser(description='Date utility')
parser.add_argument('--add', action='store_true', help='adds date')
parser.add_argument('--rmv', action='store_true', help='deletes date')
args = parser.parse_args()

SCRIPT="/home/atila/Desktop/script/"
with open(f'{SCRIPT}dates.json', 'r') as f: dates = load(f)
if args.add:
    while True:
        y=prompt('Name of event to be added (press enter to stop) \n>: ').lower()
        if y==str(): break
        z=prompt('Date in iso format yyyy-mm-dd\n>: ').lower() 
        dates[y]=z
        with open(f'{SCRIPT}dates.json', 'w+') as f: dump(dates, f, indent=4)
if args.rmv:
    while True:
        fzf = FzfPrompt()
        name = fzf.prompt(sorted(['Stop']+list(dates.keys())))[0]
        if name=='Stop': break
        del dates[name]
        with open(f'{SCRIPT}dates.json', 'w+') as f: dump(dates, f, indent=4)
now = datetime.now()
keys = list(dates.keys())
dates = {k:date.fromisoformat(dates[k]) for k in keys}
dates = {k:datetime.fromordinal(dates[k].toordinal()) for k in keys}
dates = {k:dates[k]-now for k in keys}
dates = sorted([(dates[k], k) for k in dates])
for d in dates:
    print(f"{d[1]:150s}---       Remaining time: {d[0]}")
