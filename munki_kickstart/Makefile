USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=munki_kickstart
PACKAGE_NAME=munki_kickstart
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/Users/Shared
	@sudo ${CP} .com.googlecode.munki.checkandinstallatstartup ${WORK_D}/Users/Shared/.com.googlecode.munki.checkandinstallatstartup
	@sudo chown root:wheel ${WORK_D}/Users/Shared/.com.googlecode.munki.checkandinstallatstartup
	@sudo chmod 755 ${WORK_D}/Users/Shared/.com.googlecode.munki.checkandinstallatstartup
