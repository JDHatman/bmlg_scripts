USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=mun_con_virtual
PACKAGE_NAME=mun_con_virtual
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/munki/conditions
	@sudo ${CP} virtual ${WORK_D}/usr/local/munki/conditions/virtual
	@sudo chown root:wheel ${WORK_D}/usr/local/munki/conditions/virtual
	@sudo chmod 755 ${WORK_D}/usr/local/munki/conditions/virtual
