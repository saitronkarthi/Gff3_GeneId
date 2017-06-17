#!/bin/bash
#Usage Thisscript.sh Saccharomyces_cerevisiae.R64-1-1.34.gff3 "Chromosome_choice"  "GeneNames_Chromosome_choice.txt"
#Ex: ./GetGeneIDs_Karthikeyan_Rajamani.sh  Saccharomyces_cerevisiae.R64-1-1.34.gff3  "XVI" GeneNames_XVI.txt


InputFile=$1
ChromsomeName=$2
OutputFile=$3

egrep '^'$ChromsomeName'\>' $InputFile > chromosome_filter.txt

egrep 'protein_coding' chromosome_filter.txt >chromosome_protein_coding_filter.txt
cut -f9 chromosome_protein_coding_filter.txt > chromosome_protein_coding_Col9_filter.txt

egrep '^(ID=gene)' chromosome_protein_coding_Col9_filter.txt > chromosome_protein_coding_Col9_gene_filter.txt
cat chromosome_protein_coding_Col9_gene_filter.txt |cut -c 9-15 > $OutputFile

rm chromosome_filter.txt chromosome_protein_coding_filter.txt chromosome_protein_coding_Col9_filter.txt chromosome_protein_coding_Col9_gene_filter.txt

echo "Chromosome" $ChromsomeName "protein-coding gene Id's stored in "  $OutputFile

