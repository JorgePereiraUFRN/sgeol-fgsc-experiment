#!/bin/bash
echo "Uso sh run-experimento.sh usuarios instancias"
echo "Lipando resultados Anteriores ..."
sudo rm -r /var/www/html/sbrc-fixed-req/$1*$2*10.$2/*
echo "Executando teste (usuarios: $1, instancias: $2"
if [ $2 -eq 1 ]; then
echo "Executanto na Sgeol-01"
sudo java -jar apache-jmeter-5.1.1/bin/ApacheJMeter.jar -n -t /home/imd/sgeol-fixed-requests.jmx -e -o /var/www/html/sbrc-fixed-req/$1*$2*10.$2 -l /var/www/html/sbrc-fixed-req/$1*$2.$2/log.jtl -Jusuarios-1=$1 -Jusuarios-2=0 -Jusuarios-3=0
fi

if [ $2 -eq 2 ]; then
echo "Executando na Sgeol-01 e 02"
sudo java -jar apache-jmeter-5.1.1/bin/ApacheJMeter.jar -n -t /home/imd/sgeol-fixed-requests.jmx -e -o /var/www/html/sbrc-fixed-req/$1*$2*10.$2 -l /var/www/html/sbrc-fixed-req/$1*$2*10.$2/log.jtl -Jusuarios-1=$1 -Jusuarios-2=$1 -Jusuarios-3=0
fi

if [ $2 -eq 3 ]; then
echo "Executndo na Sgeol-01,02  e 03"
sudo java -jar apache-jmeter-5.1.1/bin/ApacheJMeter.jar -n -t /home/imd/sgeol-fixed-requests.jmx -e -o /var/www/html/sbrc-fixed-req/$1*$2*10.$2 -l /var/www/html/sbrc-fixed-req/$1*$2*10.$2/log.jtl -Jusuarios-1=$1 -Jusuarios-2=$1 -Jusuarios-3=$1
fi

