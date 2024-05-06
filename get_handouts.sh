#!/bin/bash

wget --no-check-certificate https://csapp.cs.cmu.edu/3e/datalab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/bomb.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/target1.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/buflab32-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/archlab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/archlab32-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/cachelab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/perflab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/shlab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/malloclab-handout.tar
wget --no-check-certificate https://csapp.cs.cmu.edu/3e/proxylab-handout.tar

mkdir perflab-handout
tar -xf perflab-handout.tar -C perflab-handout
rm -f perflab-handout.tar

tar -xf archlab32-handout.tar
mv archlab-handout archlab32-handout
rm -f archlab32-handout.tar

ls *.tar | xargs -P 8 -I {} tar -xf {}
rm -f *.tar

mv datalab-handout   lab1_datalab-handout
mv bomb              lab2_bomb
mv target1           lab3_attachlab-handout
mv buflab-handout    lab4_buflab-handout
mv archlab-handout   lab5_archlab-handout
mv archlab32-handout lab6_archlab32-handout
mv cachelab-handout  lab7_cachelab-handout
mv perflab-handout   lab8_perflab-handout
mv shlab-handout     lab9_shlab-handout
mv malloclab-handout lab10_malloclab-handout
mv proxylab-handout  lab11_proxylab-handout

mkdir Lab

mv lab* ./Lab
