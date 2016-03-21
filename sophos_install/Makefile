USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=sophos_install
PACKAGE_NAME=sophos_install
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=pack-install\
	pack-script-postinstall

pack-install:
	@sudo mkdir -p ${WORK_D}/usr/local/bmlg_assets
	@sudo ${CP} -a sophos ${WORK_D}/usr/local/bmlg_assets/sophos
	@sudo chown -R root:wheel ${WORK_D}/usr/local/bmlg_assets/sophos
	@sudo chmod -R 777 ${WORK_D}/usr/local/bmlg_assets/sophos
