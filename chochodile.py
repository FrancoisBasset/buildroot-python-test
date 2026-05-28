#!/usr/bin/env python3
import subprocess

text: str = ''

while True:
    text: str = input('Calcul (q pour quitter) : ')

    if text == 'q':
        break
    
    print(eval(text))
    print()

subprocess.run(['poweroff'])
