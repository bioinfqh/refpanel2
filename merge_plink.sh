#!/bin/bashi


nats_file=$1
dir23=$2
mkdir -p plink

ls $dir23 >ids.txt
IFS=$'\n' read -d '' -r -a ids < ids.txt
ctr=0
echo ${ids[1]}
first_id_2=${ids[0]}
first_id=${first_id_2//.txt}
rm to_merge.txt
touch to_merge.txt
rm fam_file.fam
touch fam_file.fam
while read line; do 
    echo $ctr
    #if [[ $ctr > 1 ]]; then
    #cp $out_dir/$ctr.23andMe.txt $ctr.txt
    curr_nat=$(echo -n $line | awk '{print $2}')
    #curr_id=$(echo ${ids[$ctr]} | sed 's/\(.*\)..*/\1/')
    curr_id_2=${ids[$ctr]}
    echo $curr_id_2
    curr_id=${curr_id_2//.txt/}
    echo $curr_id
    y_lines=$(awk '{ if ($4!="--") print $2 }' $dir23/${ids[$ctr]} | grep -c Y )
    #gdr=2
    #if [[ $y_lines>0 ]]; then
    #    gdr=1
    #if [[ $ctr >  ]]; then
    echo $curr_id >>to_merge.txt
    #fi
    #/home/quirin/Downloads/plink_linux_x86_64_20201019/plink --23file $dir23/$curr_id.txt --out $curr_id
    plink_linux_x86_64_20201019/plink --23file $dir23/$curr_id.txt --out $curr_id
    echo $curr_nat $curr_id 0 0 0 1 >$curr_id.fam
    let ctr++
done<nationalities.txt


#/home/quirin/Downloads/plink_linux_x86_64_20201019/plink --bfile $first_id --merge-list to_merge.txt --make-bed --out output

plink_linux_x86_64_20201019/plink --merge-list to_merge.txt --make-bed --out output --allow-no-sex
#/home/quirin/Downloads/plink_linux_x86_64_20201019/plink --merge-list to_merge.txt --make-bed --out output --allow-no-sex
