chr=$1

plink2 --export vcf bgz --pfile "ukb_chr${chr}" --extract "/mnt/project/DNA repair genes/repair_genes_lofs.txt" --out lofs_chr${chr}_temp

awk '{print $1"_"$2}' "/mnt/project/DNA repair genes/parents_sibs_inds.txt" > parents_sibs_inds.txt
bcftools view -S parents_sibs_inds.txt -Oz -o lofs_chr${chr}.vcf.gz lofs_chr${chr}_temp.vcf.gz

zcat lofs_chr${chr}.vcf.gz | grep -v '##' | awk '{for(i=10; i<=NF; i++) {if(NR == 1) name[i] = $i; else if(NR > 1 && ($i == "0/1" || $i == "1/0" || $i == "1/1")) counter[i] = counter[i]"|"$1":"$2":"$4":"$5":"$i}} END {for(i=10; i<=NF; i++) print name[i]"\t"counter[i]}' > lofs_chr${chr}.tsv

rm lofs_chr${chr}_temp.vcf.gz
rm parents_sibs_inds.txt