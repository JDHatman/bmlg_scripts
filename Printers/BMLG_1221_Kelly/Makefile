USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=bmlg_1221_kelly
PACKAGE_NAME=bmlg_1221_kelly
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=pack-script\
	pack-script-postinstall

pack-script:
	@sudo mkdir -p ${WORK_D}/Library/Printers/PPDs/Contents/Resources
	@sudo ${CP} RICOH\ Aficio\ SP\ C242DN.ppd ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ C242DN.ppd
	@sudo chown root:admin ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ C242DN.ppd
	@sudo chmod 644 ${WORK_D}/Library/Printers/PPDs/Contents/Resources/RICOH\ Aficio\ SP\ C242DN.ppd
