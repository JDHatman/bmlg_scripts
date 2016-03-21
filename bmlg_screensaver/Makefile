USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=bmlg_screensaver
PACKAGE_NAME=bmlg_screensaver
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/outset/login-once
	@sudo ${CP} Screensaver_20160301.sh ${WORK_D}/usr/local/outset/login-once/Screensaver_20160301.sh
	@sudo chown root:wheel ${WORK_D}/usr/local/outset/login-once/Screensaver_20160301.sh
	@sudo chmod 755 ${WORK_D}/usr/local/outset/login-once/Screensaver_20160301.sh
