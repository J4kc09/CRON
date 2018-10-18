#!/bin/bash

KeyPrivada=/root/cabinadiscoroot
Cabinadisco=192.168.1.131
#Cabinadisco=192.168.9.205
dia=`date +%e`
mes=`date +%b`
fecha_busqueda="$mes $dia"

ssh -i $KeyPrivada root@$Cabinadisco 'echo Cabinadisco se apagara en 5 minutos. | wall -n && echo "`date` Mensaje de apagado enviado a Cabinadisco" >> /root/logs/practicacron.txt && shutdown 14:45 --no-wall'

echo El servidor Openldap se apagara en 5 minutos. | wall -n && echo "`date` Mensaje de apagado enviado al servidor Openldap" >> /root/logs/practicacron.txt && sleep 290 && pkill -kill -f "sshfs" && umount /root/logs/logsCabinadisco && echo "`date` Se ha desmontado el directorio logsCabinadisco correctamente" >> /root/logs/practicacron.txt || echo "`date` No se ha podido desmontar el directorio logsCabinadisco correctamente" >> /root/logs/practicacron.txt

cat /var/log/syslog | /bin/grep --ignore-case "error" | grep --ignore-case "$fecha_busqueda" >> /root/logs/Log_errores_syslog"`date +%F`".log && echo "`date` Archivo de logs de errores del sistema creado" >> /root/logs/practicacron.txt || echo "`date` No se ha creado el archivo de logs de errores correctamente" >> /root/logs/practicacron.txt

cat /root/logs/Log_errores_syslog"`date +%F`".log | mailx -s "Logs `date`" jandrokc@gmail.com && echo "`date` Mail de errores del sistema enviado" >> /root/logs/practicacron.txt || echo "`date` No se ha enviado el mail de errores del sistema" >> /root/logs/practicacron.txt

sleep 10 && shutdown now



