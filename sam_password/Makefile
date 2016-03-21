USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=sam_password
PACKAGE_NAME=sam_password
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/etc/pam.d/
	@sudo ${CP} screensaver ${WORK_D}/etc/pam.d/screensaver
	@sudo chown root:wheel ${WORK_D}/etc/pam.d/screensaver
	@sudo chmod 644 ${WORK_D}/etc/pam.d/screensaver
