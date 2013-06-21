#! /bin/bash
RADICE_NOME_FILE="Prpout10"
TIPO_FILE="Protons"
#RADICE_NOME_FILE="Elpout10"
#TIPO_FILE="Electrons"
###############################################################
GNUPLOT_FILE_EXTENSION="plt"
PROPAGA_FILE_EXTENSION="ppg"
IMAGE_FILE_EXTENSION="png"
###############################################################
xmin=27
xmax=36
deltax=1
ymin="-0.0005"
ymax="0.0005"
zmin="0.0"
zmax="0.0010"
###############################################################
### NON TOCCARE DA QUI IN POI #################################
###############################################################
PROPAGA_FILE="${RADICE_NOME_FILE}_xyzE.${PROPAGA_FILE_EXTENSION}"
x0=$xmin
x1=$xmax
GNUPLOT_FILE="${RADICE_NOME_FILE}_xyE_${x0}_${x1}.${GNUPLOT_FILE_EXTENSION}"
IMAGE_FILE="${RADICE_NOME_FILE}_xyE_${x0}_${x1}.${IMAGE_FILE_EXTENSION}"
rm -f ${GNUPLOT_FILE}
touch ${GNUPLOT_FILE}
chmod 775 ${GNUPLOT_FILE}
printf "#!/gnuplot\n" >> ${GNUPLOT_FILE}
printf "FILE_IN='${PROPAGA_FILE}'\n" >> ${GNUPLOT_FILE}
printf "FILE_OUT='slice_${IMAGE_FILE}'\n" >> ${GNUPLOT_FILE}
printf "set terminal ${IMAGE_FILE_EXTENSION} truecolor enhanced size 1600,1200\n" >> ${GNUPLOT_FILE}
printf "set output FILE_OUT\n" >> ${GNUPLOT_FILE}
#printf "set xlabel 'x ({/Symbol m}m)' \n" >> ${GNUPLOT_FILE}
#printf "set ylabel 'y ({/Symbol m}m)'\n" >> ${GNUPLOT_FILE}
printf "set xlabel 'x (um)' \n" >> ${GNUPLOT_FILE}
printf "set ylabel 'y (um)'\n" >> ${GNUPLOT_FILE}
printf "titolo=sprintf('${TIPO_FILE} with ${x0} < x < ${x1}')\n" >> ${GNUPLOT_FILE}
printf "set title titolo\n" >> ${GNUPLOT_FILE}
printf "set cblabel 'Energy (MeV)'\n" >> ${GNUPLOT_FILE}
printf "set style fill transparent solid 0.1\n" >> ${GNUPLOT_FILE}
printf "plot FILE_IN u (((\$1 > ${ymin}) && (\$1 < ${ymax})) ? (\$1)*10000 : 1/0):(((\$2 > ${zmin}) && (\$2 < ${zmax})) ? (\$2)*10000 : 1/0):(((\$3 > 0.00${x0}) && (\$3 < 0.00${x1}))  ? \$4 : 1/0) with dots palette t''\n" >> ${GNUPLOT_FILE}
gnuplot ${GNUPLOT_FILE} &

for (( x0=$xmin; x0<$xmax; x0+=$deltax ))
do
    x1=`expr $x0 + $deltax`
    GNUPLOT_FILE="${RADICE_NOME_FILE}_xyE_${x0}_${x1}.${GNUPLOT_FILE_EXTENSION}"
    IMAGE_FILE="${RADICE_NOME_FILE}_xyE_${x0}_${x1}.${IMAGE_FILE_EXTENSION}"
    rm -f ${GNUPLOT_FILE}
    touch ${GNUPLOT_FILE}
    chmod 775 ${GNUPLOT_FILE}
    printf "#!/gnuplot\n" >> ${GNUPLOT_FILE}
    printf "FILE_IN='${PROPAGA_FILE}'\n" >> ${GNUPLOT_FILE}
    printf "FILE_OUT='slice_${IMAGE_FILE}'\n" >> ${GNUPLOT_FILE}
    printf "set terminal ${IMAGE_FILE_EXTENSION} truecolor enhanced size 1600,1200\n" >> ${GNUPLOT_FILE}
    printf "set output FILE_OUT\n" >> ${GNUPLOT_FILE}
    #printf "set xlabel 'x ({/Symbol m}m)' \n" >> ${GNUPLOT_FILE}
    #printf "set ylabel 'y ({/Symbol m}m)'\n" >> ${GNUPLOT_FILE}
    printf "set xlabel 'x (um)' \n" >> ${GNUPLOT_FILE}
    printf "set ylabel 'y (um)'\n" >> ${GNUPLOT_FILE}
    printf "titolo=sprintf('${TIPO_FILE} with ${x0} < x < ${x1}')\n" >> ${GNUPLOT_FILE}
    printf "set title titolo\n" >> ${GNUPLOT_FILE}
    printf "set cblabel 'Energy (MeV)'\n" >> ${GNUPLOT_FILE}
    printf "set style fill transparent solid 0.1\n" >> ${GNUPLOT_FILE}
    printf "plot FILE_IN u (((\$1 > ${ymin}) && (\$1 < ${ymax})) ? (\$1)*10000 : 1/0):(((\$2 > ${zmin}) && (\$2 < ${zmax})) ? (\$2)*10000 : 1/0):(((\$3 > 0.00${x0}) && (\$3 < 0.00${x1}))  ? \$4 : 1/0) with dots palette t''\n" >> ${GNUPLOT_FILE}
    gnuplot ${GNUPLOT_FILE} &
done

