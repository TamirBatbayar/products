#!/bin/bash 

# 1. 動くプログラムを早く書く
# 2. 磨いて、もっとも早く処理するようにする。
# 3. Gehdee ene bol 1 udaa ajillah uchraas hurdan baih albagui
# Dummy test data uusgegch
# data=$(cat top_products.csv | tr ',' ' ')
rows=$(cat products.csv | tr ',' ' ' | tee data | awk '{print $1}')

for row in $rows
do
 file_name=$(awk 'FNR=='$row' {print $2}' data)
 mkdir bigdata_search/$file_name
 echo $row $file_name
 awk 'FNR=='$row'{print $0}' data > bigdata_search/$file_name/$file_name
done

# ===================== Create 100 mln dummy data ====================
# for i in {1..100000000}
# do
#    file_name="new_product_'$i'"
#    mkdir bigdata_search/$file_name
#    echo $i $file_name 100 "detail'$i'" $(date) > bigdata_search/$file_name/$file_name
# done
#echo $data_names
