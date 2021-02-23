
nats_file=$1
dir23=$2

bash merge_plink.sh $nats_file $dir23 > /dev/null 2>&1
Rscript plinkToRef.R output.bed > /dev/null 2>&1
python3 multiply_files.py refPanel_output.bed.txt nInd_output.bed.txt 6 >panel1.txt
awk '$5 != "NA" && $6 != "NA"' panel1.txt >panel.txt
#awk -v OFS=' ' 'NR==1{for (i=1;i<=NF;i++)if ($i=="TO_DEL"){n=i-1;m=NF-(i==NF)}} {for(i=1;i<=NF;i+=1+(i==n))printf "%s%s",$i,i==m?ORS:OFS}' panel2.txt >panel.txt
gzip -c panel.txt
