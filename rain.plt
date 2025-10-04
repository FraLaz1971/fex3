reset
set terminal png
set output 'out.png' 
set style data histogram
set style histogram clustered
set style fill solid 1.0 border lt -1
set xtic rotate by -45 scale 0
set xlabel 'month' 
set ylabel 'rainfall(mm x m**2)' 
$file1 << EOD
January    10.4
February   11.1
March       8.3
April       7.5
May         3.2
June        4.6
July        3.2
August      4.5
September   2.1
October     3.1
November   10.1
December   11.1
EOD
plot '$file1' using 2:xtic(1) title 'rainfall'              
