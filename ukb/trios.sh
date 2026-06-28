chr=$1
b=$2

path="/mnt/project/DNM/trios/blocks/"

p=0

while IFS= read -r trio
do

   echo $trio | awk '{print $1, $1}'  > "trio_pair_v0.txt"
   echo $trio | awk '{print $2, $2}'  >> "trio_pair_v0.txt"
   echo $trio | awk '{print $3, $3}'  >> "trio_pair_v0.txt"

   plink2 --export vcf bgz --pfile "ukb_chr${chr}" --mac 1 --max-mac 1 --keep trio_pair_v0.txt --out trios_chr${chr}_b${b}_p${p}_temp

   awk '{print $1"_"$1}' "trio_pair_v0.txt" > "trio_pair_v1.txt"

   bcftools view -S trio_pair_v1.txt -Oz -o trios_chr${chr}_b${b}_p${p}.vcf.gz trios_chr${chr}_b${b}_p${p}_temp.vcf.gz
   zcat trios_chr${chr}_b${b}_p${p}.vcf.gz | grep -v '##' | awk '{curr = 10; opp1 = 11; opp2 = 12; if(NR == 1) name = $curr; else if(NR > 1 && ($curr == "0/1" || $curr == "1/0") && $opp1 == "0/0" && $opp2 == "0/0") counter = counter"|"$1":"$2":"$4":"$5} END {print name"\t"counter}' > trios_chr${chr}_b${b}_p${p}.tsv

   rm trio_pair_v*.txt
   rm trios_chr${chr}_b${b}_p${p}_temp.*

   echo "Trio: ${p}"
   p=$((p+1))

done < "${path}trios_pairs_b${b}.txt"
