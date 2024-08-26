#!/bin/sh

~/yasara-model/yasara -txt "./defbindres.mcr" "MacroTarget='$1'" "radius=$2"

grep Residue $1-defbindres.txt | awk '{print $2$4}' > tmp1
grep ATOM $1-rec.pdb | grep CA | awk '{print $4$6}' > tmp2
tmp3=`wc -l tmp2 | awk '{print $1}'`
for i in $(seq 1 $tmp3); do echo $i; done > tmp4
paste tmp4 tmp2 > tmp5
for i in $(cat tmp1); do grep $i tmp5; done > $1.bindres-num-name.lst
rm tmp* 
cat $1.bindres-num-name.lst
