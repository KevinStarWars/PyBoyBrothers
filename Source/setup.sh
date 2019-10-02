#!/bin/bash

virtualenv -p pypy .venv
source .venv/bin/activate

pip install -r requirements.txt

mkdir ROMs
cd ROMs
wget https://s2roms.cc/s3roms/Gameboy/Super%20Mario%20Land%20%28JUE%29%20%28V1.1%29%20%5B%21%5D.zip
unzip Super\ Mario\ Land\ \(JUE\)\ \(V1.1\)\ \[\!\].zip