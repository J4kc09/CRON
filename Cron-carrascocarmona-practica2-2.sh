#!/bin/bash

KeyPrivada=/root/cabinadiscoroot
#Cabinadisco=192.168.1.131
Cabinadisco=192.168.9.205

scp -i $KeyPrivada /home/carrascocarmona/DiscoOpenldap/* root@$Cabinadisco:/home/carrascocarmona/BackupOpenldap && echo "`date` Se ha realizado el backup del disco de Openldap correctamente" >> /root/logs/practicacron.txt || echo "`date` No se ha realizado el backup del disco Openldap" >> /root/logs/practicacron.txt
