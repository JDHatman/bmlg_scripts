USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=sharing_info
PACKAGE_NAME=sharing_info
REVERSE_DOMAIN=com.bmlg
PAYLOAD=\
	pack-script\
	pack-Library-LaunchAgents-com.bmlg.sharing_info.plist\
	pack-script-postinstall
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/bmlg_assets
	@sudo ${CP} sharing_info.app.tar.bz2 ${WORK_D}/usr/local/bmlg_assets/sharing_info.app.tar.bz2
	@sudo chown root:wheel ${WORK_D}/usr/local/bmlg_assets/sharing_info.app.tar.bz2
	@sudo chmod 777 ${WORK_D}/usr/local/bmlg_assets/sharing_info.app.tar.bz2

