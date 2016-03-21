USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=ipinmenubarlaunch
PACKAGE_NAME=ipinmenubarlaunch
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/Library/LaunchAgents
	@sudo ${CP} com.ipinmenubar.application.plist ${WORK_D}/Library/LaunchAgents/com.ipinmenubar.application.plist
	@sudo chown root:wheel ${WORK_D}/Library/LaunchAgents/com.ipinmenubar.application.plist
	@sudo chmod 644 ${WORK_D}/Library/LaunchAgents/com.ipinmenubar.application.plist
