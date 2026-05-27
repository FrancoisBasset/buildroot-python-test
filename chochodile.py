#!/usr/bin/env python
import subprocess

text: str = ''

while True:
    text: str = input('Calcul (q pour quitter) : ')

    if text == 'q':
        break
    
    print(eval(text))
    print()

subprocess.run(['poweroff'])