chr=$1

plink2 --export vcf bgz --pfile "ukb_chr${chr}" --extract "/mnt/project/DNA repair genes/repair_genes_miss.txt" --out miss_chr${chr}_temp

awk '{print $1"_"$2}' "/mnt/project/DNA repair genes/parents_sibs_inds.txt" > parents_sibs_inds.txt
bcftools view -S parents_sibs_inds.txt -Oz -o miss_chr${chr}.vcf.gz miss_chr${chr}_temp.vcf.gz

zcat miss_chr${chr}.vcf.gz | grep -v '##' | awk '{for(i=10; i<=NF; i++) {if(NR == 1) name[i] = $i; else if(NR > 1 && ($i == "0/1" || $i == "1/0" || $i == "1/1")) counter[i] = counter[i]"|"$1":"$2":"$4":"$5":"$i}} END {for(i=10; i<=NF; i++) print name[i]"\t"counter[i]}' > miss_chr${chr}.tsv

rm miss_chr${chr}_temp.vcf.gz
rm parents_sibs_inds.txt