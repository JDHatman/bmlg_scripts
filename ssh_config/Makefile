USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=ssh_config
PACKAGE_NAME=ssh_config
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/outset/login-once
	@sudo ${CP} ssh_config_20160317.sh ${WORK_D}/usr/local/outset/login-once/ssh_config_20160317.sh
	@sudo chown root:wheel ${WORK_D}/usr/local/outset/login-once/ssh_config_20160317.sh
	@sudo chmod 755 ${WORK_D}/usr/local/outset/login-once/ssh_config_20160317.sh
