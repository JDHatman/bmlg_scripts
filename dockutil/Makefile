USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=dockutil
PACKAGE_NAME=dockutil
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/bin
	@sudo ${CP} dockutil ${WORK_D}/usr/local/bin/dockutil
	@sudo chown root:wheel ${WORK_D}/usr/local/bin/dockutil
	@sudo chmod 755 ${WORK_D}/usr/local/bin/dockutil
