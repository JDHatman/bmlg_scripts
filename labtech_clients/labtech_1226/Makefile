USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=labtech_1226_install
PACKAGE_NAME=labtech_1226_install
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=pack-install\
	pack-script-postinstall

pack-install:
	@sudo mkdir -p ${WORK_D}/usr/local/bmlg_assets
	@sudo ${CP} -a labtech_1226_install ${WORK_D}/usr/local/bmlg_assets/labtech_1226_install
	@sudo chown -R root:wheel ${WORK_D}/usr/local/bmlg_assets/labtech_1226_install
	@sudo chmod -R 777 ${WORK_D}/usr/local/bmlg_assets/labtech_1226_install
