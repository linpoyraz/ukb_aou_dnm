chr=$1
b=$2

path="/mnt/project/DNM/twins/blocks/"

p=0

while IFS= read -r pair
do

   echo $pair | awk '{print $1, $1}'  > "twin_pair.txt"
   echo $pair | awk '{print $2, $2}' >> "twin_pair.txt"

   plink2 --export vcf bgz --pfile "ukb_chr${chr}" --mac 1 --max-mac 1 --keep twin_pair.txt --out twins_chr${chr}_b${b}_p${p}
   zcat twins_chr${chr}_b${b}_p${p}.vcf.gz | grep -v '##' | awk '{for(i=0; i<=1; i++) {curr = 10+i; opp = 11-i; if(NR == 1) name[i] = $curr; else if(NR > 1 && ($curr == "0/1" || $curr == "1/0") && $opp == "0/0") counter[i] = counter[i]"|"$1":"$2":"$4":"$5}} END {for(i=0; i<=1; i++) print name[i]"\t"counter[i]}' > twins_chr${chr}_b${b}_p${p}.tsv

   rm twin_pair.txt

   echo "Pair: ${p}"
   p=$((p+1))

done < "${path}twins_pairs_b${b}.txt"
