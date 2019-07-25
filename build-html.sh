#!/bin/bash

cp -r ext/julia/doc ext/julia/doc.org
cp -r translated/ja/* ext/julia/doc/src

cd ext/julia/doc
make
cd ../../../

mv ext/julia/doc ext/julia/doc.ja
mv ext/julia/doc.org  ext/julia/doc
