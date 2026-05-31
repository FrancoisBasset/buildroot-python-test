#!/usr/bin/env python3
import shutil
import subprocess

def reset():
    subprocess.run(["clear"])
    terminal_width: int = shutil.get_terminal_size().columns

    for _ in range(terminal_width):
        print('█', end='')

    print()

    start: int = terminal_width // 2 - 4

    for _ in range(start):
        print('█', end='')

    print('Sevenux', end='')

    for _ in range(start + 7, terminal_width):
        print('█', end='')

    print()

    for _ in range(terminal_width):
        print('█', end='')

    print('q pour quitter, r pour reset')

reset()

text: str = ''

while True:
    text: str = input('Calcul : ')

    if text == 'q':
        break
    if text == 'r':
        reset()
        continue

    try:
        print(eval(text))
        print()
    except SyntaxError, NameError:
        pass

subprocess.run(['poweroff'])

