#!/bin/bash
echo "Rodando experimento"

script_jmeter='/home/imd/experimento/scripts-jmeter/exp1/geo-queries-1m.jmx'
pasta_resultados_teste='/var/www/html/teste-carga/exp1/geo-queries'

echo "Lipando resultados Anteriores ..."
rm -r $pasta_resultados_teste/u-$1_i-$2_r-$3/*
echo "Executando teste (usuarios: $1, instancias: $2, rodada: $3"


if [ $2 -eq 1 ]; then
echo "Executanto na Sgeol-01"
java -jar /home/imd/apache-jmeter-5.4.1/bin/ApacheJMeter.jar -n -t $script_jmeter -e -o $pasta_resultados_teste/u-$1_i-$2_r-$3/ -l $pasta_resultados_teste/u-$1_i-$2_r-$3/log.jtl -Jusuarios-1=$1 -Jusuarios-2=0 -Jusuarios-3=0
fi

if [ $2 -eq 2 ]; then
echo "Executanto na Sgeol-01 e Sgeol-02 "
java -jar /home/imd/apache-jmeter-5.4.1/bin/ApacheJMeter.jar -n -t $script_jmeter -e -o $pasta_resultados_teste/u-$1_i-$2_r-$3/ -l $pasta_resultados_teste/u-$1_i-$2_r-$3/log.jtl -Jusuarios-1=$1 -Jusuarios-2=$1 -Jusuarios-3=0
fi


if [ $2 -eq 3 ]; then
echo "Executanto na Sgeol-01, Sgeol-02 e Sgeol-03"
java -jar /home/imd/apache-jmeter-5.4.1/bin/ApacheJMeter.jar -n -t $script_jmeter -e -o $pasta_resultados_teste/u-$1_i-$2_r-$3/ -l $pasta_resultados_teste/u-$1_i-$2_r-$3/log.jtl -Jusuarios-1=$1 -Jusuarios-2=$1 -Jusuarios-3=$1
fi
