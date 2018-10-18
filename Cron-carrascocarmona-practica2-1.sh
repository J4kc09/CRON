#!/bin/bash

KeyPrivada=/root/cabinadiscoroot
#Cabinadisco=192.168.1.131
Cabinadisco=192.168.9.205

ntpdate hora.rediris.es && sleep 120 && hwclock -w && echo "`date` Se ha sincronizado la hora del Servidor Openldap" >> /root/logs/practicacron.txt || echo "`date` No se ha podido realizar la sincronizacion de la hora del servidor de Openldap" >> /root/logs/practicacron.txt

ssh -i $KeyPrivada root@$Cabinadisco 'ntpdate hora.rediris.es && sleep 120 && hwclock -w && echo "`date` Se ha sincronizado la hora del Cabinadisco" >> /root/logs/practicacron.txt || echo "`date` No se ha podido realizar la sincronizacion de la hora del Cabinadisco" >> /root/logs/practicacron.txt'

sshfs root@$Cabinadisco:/root/logs /root/logs/logsCabinadisco -o IdentityFile=$KeyPrivada && echo "`date` Se ha montado el directorio logsCabinadisco correctamente" >> /root/logs/practicacron.txt || echo "`date` No se ha podido montar el directorio logsCabinadisco" >> /root/logs/practicacron.txt
