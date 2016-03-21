USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=copy_user_data
PACKAGE_NAME=copy_user_data
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/Users/Shared
	@sudo ${CP} copy_user_data.command ${WORK_D}/Users/Shared/copy_user_data.command
	@sudo chown root:wheel ${WORK_D}/Users/Shared/copy_user_data.command
	@sudo chmod 755 ${WORK_D}/Users/Shared/copy_user_data.command
