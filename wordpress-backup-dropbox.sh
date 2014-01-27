#!/bin/bash
DAY=`date +%d`
MONTH=`date +%m`
YEAR=`date +%Y`
HOURS=`date +%H`
MINUTES=`date +%M`
SECONS=`date +%S`
DIR_LOCAL="/home/rafacuest/www/"
DIR_TEMPORAL="/home/rafacuest/"
ARCHIVO_COPIA="$YEAR-$MONTH-$DAY-$HOURS:$MINUTES:$SECONS"
DIRETORIO_REMOTO="copia_seg"
DIRECTORIO_INSTALACION_DROPBOX_UPLOADER="/home/rafacuest/Dropbox-Uploader/"
ARCHIVO_BBDD="$YEAR-$MONTH-$DAY-$HOURS:$MINUTES:$SECONS"
SERVIDOR_BBDD="xxxxxxx"
USER_BBDD="xxxxxxx"
PASSWORD="xxxxxxx"
NAME_DDBB="xxxxxxx"
#comprimo el directorio donde se alija el wordpress
zip -r $DIR_TEMPORAL$ARCHIVO_COPIA.zip $DIR_LOCAL
#volca la base de datos en un archivo sql
mysqldump -h $SERVIDOR_BBDD -u $USER_BBDD -p$PASSWORD $NAME_DDBB > $DIR_TEMPORAL$ARCHIVO_BBDD.sql
#anado el archivo de volcado de la bbbdd
zip -rv $DIR_TEMPORAL$ARCHIVO_COPIA.zip  $DIR_TEMPORAL$ARCHIVO_BBDD.sql

$DIRECTORIO_INSTALACION_DROPBOX_UPLOADER/dropbox_uploader.sh upload $DIR_TEMPORAL$ARCHIVO_COPIA.zip $DIRETORIO_REMOTO
rm $DIR_TEMPORAL$ARCHIVO_COPIA.zip
rm  $DIR_TEMPORAL$ARCHIVO_BBDD.sql
