#!/bin/tcsh

cd run1
gmx trjconv -f md_0_1nj.xtc -o md_0_1nj2.xtc -s md_0_1.tpr -pbc cluster <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj2.xtc -o md_0_1nj3.xtc -s md_0_1.tpr -pbc mol -ur compact -center <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj3.xtc  -o md_0_1nj4.xtc -s md_0_1.tpr -center -fit rot+trans <<EOF || exit 1
Backbone
Backbone
Protein
EOF
cd ../run2
gmx trjconv -f md_0_1nj.xtc -o md_0_1nj2.xtc -s md_0_1.tpr -pbc cluster <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj2.xtc -o md_0_1nj3.xtc -s md_0_1.tpr -pbc mol -ur compact -center <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj3.xtc  -o md_0_1nj4.xtc -s md_0_1.tpr -center -fit rot+trans <<EOF || exit 1
Backbone
Backbone
Protein
EOF
cd ../run3
gmx trjconv -f md_0_1nj.xtc -o md_0_1nj2.xtc -s md_0_1.tpr -pbc cluster <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj2.xtc -o md_0_1nj3.xtc -s md_0_1.tpr -pbc mol -ur compact -center <<EOF || exit 1
Protein
Protein
EOF
gmx trjconv -f md_0_1nj3.xtc  -o md_0_1nj4.xtc -s md_0_1.tpr -center -fit rot+trans <<EOF || exit 1
Backbone
Backbone
Protein
EOF
