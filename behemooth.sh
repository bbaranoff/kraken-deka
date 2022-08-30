#!/bin/bash
offset_total=0
echo 0 > test
for abblay in $echo $(ls /media/$USER/tables) ; do abblay2=$(echo $abblay | sed 's/.dlt//g');
cd /media/$USER/indexes/
/media/$USER/indexes/kraken/TableConvert/TableConvert di /media/$USER/tables/$abblay2.dlt $abblay2.ins:$offset_total $abblay2.idx
taille_arrondie=$(echo $(( $(( $(stat -c%s $abblay2.ins)/4096 )) +1 )) *4096 | bc)
offset_total=$(($taille_arrondie + $offset_total))
echo $taille_arrondie >> test
done
