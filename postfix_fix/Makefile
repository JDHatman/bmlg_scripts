USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=postfix_fix
PACKAGE_NAME=postfix_fix
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-file \
	pack-script-postinstall
  
pack-file:
	@sudo mkdir -p ${WORK_D}/etc/postfix/
	@sudo ${CP} sasl_passwd ${WORK_D}/etc/postfix/sasl_passwd
	@sudo chown root:wheel ${WORK_D}/etc/postfix/sasl_passwd
	@sudo chmod 600 ${WORK_D}/etc/postfix/sasl_passwd
