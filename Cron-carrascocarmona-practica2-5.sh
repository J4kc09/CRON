#!/bin/sh

(

/usr/local/bin/rkhunter --versioncheck

/usr/local/bin/rkhunter --update

/usr/local/bin/rkhunter --cronjob --report-warnings-only

)| mailx -s "`date` Resultados de rkhunter" jandrokc@gmail.com && echo "`date` Mail de resultados de rkhunter enviado" >> /root/logs/practicacron.txt || echo "No se ha enviado el analisis de rkhunter" >> /root/logs/practicacron.txt
