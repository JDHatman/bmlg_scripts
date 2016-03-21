USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=bmlg_1219_second_floor
PACKAGE_NAME=bmlg_1219_second_floor
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=pack-script\
	pack-script2\
	pack-script-postinstall

pack-script:
	@sudo mkdir -p ${WORK_D}/Library/Printers/PPDs/Contents/Resources
	@sudo ${CP} RICOH\ Aficio\ SP\ 5210SR.gz ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ 5210SR.gz
	@sudo chown root:admin ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ 5210SR.gz
	@sudo chmod 644 ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ 5210SR.gz

pack-script2:
	@sudo ${CP} -a RICOH ${WORK_D}/Library/Printers/RICOH
	@sudo chown -R root:wheel ${WORK_D}/Library/Printers/RICOH
	@sudo chmod -R 555 ${WORK_D}/Library/Printers/RICOH
	@sudo chmod +t ${WORK_C}/Library/Printers/RICOH
