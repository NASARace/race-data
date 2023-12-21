#!/bin/bash

# retrieve a series of archived HRRR forecasts
# usage:  ../get_range.sh 20200820 0 4 

FC_DATE=$1
FC_TIME_START=$2
FC_TIME_END=$3
FC_START=$4
FC_END=$5

MATCH_PATTERN=":(UGRD|VGRD|TMP|TCDC):(2 m|10 m|entire atmosphere).*:"
LON_MINMAX="-124:-104"
LAT_MINMAX="23:48"
SUFFIX="west"

for t in $(seq $FC_TIME_START $FC_TIME_END)
do
	FCT=$(printf "t%02dz" $t)

	for fc in $(seq $FC_START $FC_END)
	do
	   FCS=$(printf "%02d" $fc)
	   SRC_FILE=hrrr.$FCT.wrfsfcf$FCS-$FC_DATE.grib2
           echo "---- getting $FCT : $FCS" 
	   wget -O $SRC_FILE "https://pando-rgw01.chpc.utah.edu/hrrr/sfc/$FC_DATE/hrrr.$FCT.wrfsfcf$FCS.grib2"

	   DST_FILE=hrrr-$SUFFIX-wrfsfcf-$FC_DATE-$FCT-$FCS.grib2
	   wgrib2 $SRC_FILE -match "$MATCH_PATTERN" -small_grib $LON_MINMAX $LAT_MINMAX $DST_FILE
	   rm $SRC_FILE
	done
done

