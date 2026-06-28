chr=$1
b=$2

path="/mnt/project/DNM/"

p=0

while IFS= read -r pair
do

   sib1=$(echo $pair | awk '{print $1}')
   sib2=$(echo $pair | awk '{print $2}')

   start=$(grep -n ">start:${sib1}-${sib2}" "${path}snipar/sibs_ibd2.bed" | awk -F: '{print $1}')
   end=$(grep -n ">end:${sib1}-${sib2}" "${path}snipar/sibs_ibd2.bed" | awk -F: '{print $1}')
   start=$((start+1))
   end=$((end-1))

   echo $pair | awk '{print $1, $1}'  > "sib_pair.txt"
   echo $pair | awk '{print $2, $2}' >> "sib_pair.txt"
   sed -n "${start},${end}p" "${path}snipar/sibs_ibd2.bed" > sib_range.bed

   plink2 --export vcf bgz --pfile "ukb_chr${chr}" --mac 1 --max-mac 1 --keep sib_pair.txt --extract bed0 sib_range.bed --out sibs_chr${chr}_b${b}_p${p}
   zcat sibs_chr${chr}_b${b}_p${p}.vcf.gz | grep -v '##' | awk '{for(i=0; i<=1; i++) {curr = 10+i; opp = 11-i; if(NR == 1) name[i] = $curr; else if(NR > 1 && ($curr == "0/1" || $curr == "1/0") && $opp == "0/0") counter[i] = counter[i]"|"$1":"$2":"$4":"$5}} END {for(i=0; i<=1; i++) print name[i]"\t"counter[i]}' > sibs_chr${chr}_b${b}_p${p}.tsv

   rm sib_pair.txt
   rm sib_range.bed

   echo "Pair: ${p}"
   p=$((p+1))

done < "${path}sibs/blocks/sibs_pairs_b${b}.txt"
