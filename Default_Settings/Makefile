USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=Default_Settings
PACKAGE_NAME=Default_Settings
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/outset/login-once
	@sudo ${CP} default_settings_adobe_2016_0229_1.sh ${WORK_D}/usr/local/outset/login-once/default_settings_2016_0229_1.sh
	@sudo chown root:wheel ${WORK_D}/usr/local/outset/login-once/default_settings_2016_0229_1.sh
	@sudo chmod 755 ${WORK_D}/usr/local/outset/login-once/default_settings_2016_0229_1.sh
