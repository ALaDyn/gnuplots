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
xmin=28
xmax=36
RESX=16000
RESY=12000
transparency=1.0
fontsize=100
axisthickness=14
###############################################################
### NON TOCCARE DA QUI IN POI #################################
###############################################################
PROPAGA_FILE="${RADICE_NOME_FILE}_xyzE.${PROPAGA_FILE_EXTENSION}"
x0=$xmin
x1=$xmax
GNUPLOT_FILE="${RADICE_NOME_FILE}_xyzE_${x0}_${x1}.${GNUPLOT_FILE_EXTENSION}"
IMAGE_FILE="${RADICE_NOME_FILE}_xyzE_${x0}_${x1}.${IMAGE_FILE_EXTENSION}"
rm -f ${GNUPLOT_FILE}
touch ${GNUPLOT_FILE}
chmod 775 ${GNUPLOT_FILE}
printf "#!/gnuplot\n" >> ${GNUPLOT_FILE}
printf "FILE_IN='${PROPAGA_FILE}'\n" >> ${GNUPLOT_FILE}
printf "FILE_OUT='${IMAGE_FILE}'\n" >> ${GNUPLOT_FILE}
printf "set terminal ${IMAGE_FILE_EXTENSION} truecolor enhanced size ${RESX},${RESY} font ",${fontsize}"\n" >> ${GNUPLOT_FILE}
printf "set output FILE_OUT\n" >> ${GNUPLOT_FILE}
#printf "set xlabel 'x ({/Symbol m}m)'\n" >> ${GNUPLOT_FILE}
#printf "set ylabel 'y ({/Symbol m}m)'\n" >> ${GNUPLOT_FILE}
#printf "set ylabel 'z ({/Symbol m}m)'\n" >> ${GNUPLOT_FILE}
printf "set xlabel 'x (um)'\n" >> ${GNUPLOT_FILE}
printf "set ylabel 'y (um)'\n" >> ${GNUPLOT_FILE}
printf "set zlabel 'z (um)'\n" >> ${GNUPLOT_FILE}
printf "titolo=sprintf('${TIPO_FILE} with ${x0} < x < ${x1}')\n" >> ${GNUPLOT_FILE}
printf "set title titolo\n" >> ${GNUPLOT_FILE}
printf "set border 19 lw ${axisthickness}\n" >> ${GNUPLOT_FILE}
printf "set cblabel 'Energy (MeV)'\n" >> ${GNUPLOT_FILE}
printf "set style fill transparent solid ${transparency}\n" >> ${GNUPLOT_FILE}
printf "splot FILE_IN u ((\$1)*10000):((\$2)*10000):((\$3)*10000):(((\$3 > 0.00${x0}) && (\$3 < 0.00${x1}))  ? \$4 : 1/0) with dots palette t''\n" >> ${GNUPLOT_FILE}
gnuplot ${GNUPLOT_FILE} 

