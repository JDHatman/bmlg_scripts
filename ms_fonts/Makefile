USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=ms_fonts
PACKAGE_NAME=ms_fonts
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/Library/Fonts
	@sudo ${CP} -a Microsoft ${WORK_D}/Library/Fonts/Microsoft
	@sudo chown -R root:wheel ${WORK_D}/Library/Fonts/Microsoft
	@sudo chmod -R 777 ${WORK_D}/Library/Fonts/Microsoft
	@sudo chmod +t ${WORK_C}/Library/Fonts/Microsoft
