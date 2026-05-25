#!/usr/bin/env python

import os

text: str = ''

while True:
    text: str = input('Calcul : ')

    if text == 'q':
        break
    
    print(eval(text))
    print()

os.system('poweroff')