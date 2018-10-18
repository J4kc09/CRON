#/bin/bash

mailx -s "Logs de la practica de cron " "jandrokc@gmail.com" < /root/logs/practicacron.txt && echo "`date` Logs practicacron.txt enviados" >> /root/logs/practicacron.txt || echo "`date` No se han enviado lso logs practicacron.txt" >> /root/logs/practicacron.txt
