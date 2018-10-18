#!/bin/sh

echo -ne "\n" | rkhunter -c --report-warnings-only | mailx -s "`date` Resultados de rkhunter" jandrokc@gmail.com && echo "`date` Mail de resultados de rkhunter enviado" >> /root/logs/practicacron.txt || echo "No se ha enviado el analisis de rkhunter" >> /root/logs/practicacron.txt
