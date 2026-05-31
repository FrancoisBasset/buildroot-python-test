#!/usr/bin/env python3
import subprocess

text: str = ''

while True:
    text: str = input('Calcul (q pour quitter) : ')

    if text == 'q':
        break

    try:
        print(eval(text))
        print()
    except SyntaxError, NameError:
        pass

subprocess.run(['poweroff'])
