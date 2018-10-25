#/bin/bash
lastweek=`date +%V-%d-%m-%Y`

cat /root/logs/practicacron.txt | grep $lastweek | mailx -s "Logs de la practica de cron " "jandrokc@gmail.com" && echo "`date` Logs practicacron.txt enviados" >> /root/logs/practicacron.txt || echo "`date` No se han enviado lso logs practicacron.txt" >> /root/logs/practicacron.txt
