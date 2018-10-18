#!/bin/bash

last -s "-2day" -t "-1day" | grep -v "reboot" | awk '{print $1, $4,$5,$6,$7,$8,$9}' > /root/logs/Usuarios_logueados.txt && echo "`date` Registro de logs de usuarios logueados creado" >> /root/logs/practicacron.txt || echo "`date` No se ha podido crear el registro de logs de usuarios logueados" >> /root/logs/practicacron.txt

cat /root/logs/Usuarios_logueados.txt | mailx -s "`date` Registro de usuarios logueados" jandrokc@gmail.com && echo "`date` Mail de registro de usuarios logueados enviado" >> /root/logs/practicacron.txt || echo "`date` No se ha enviado el reguistro de usuarios logueados" >> /root/logs/practicacron.txt
