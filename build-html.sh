#!/bin/bash
po4a po4a.cfg
read -p "devdocs/eval.md の改行を修正してください:" dummy

cp -r ext/julia/doc ext/julia/doc.org
cp -r translated/ja/* ext/julia/doc/src

cd ext/julia/doc
make
cd ../../../

rm -rf docs/ja/v1.3/*
cp -r ext/julia/doc/_build/html/en/* docs/ja/v1.3
rm -rf ext/julia/doc
mv ext/julia/doc.org  ext/julia/doc
