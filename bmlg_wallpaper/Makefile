USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make

TITLE=bmlg_wallpaper
PACKAGE_NAME=bmlg_wallpaper
REVERSE_DOMAIN=com.jasonhatman
PAYLOAD=\
	pack-script
  
pack-script:
	@sudo mkdir -p ${WORK_D}/usr/local/bmlg_assets
	@sudo ${CP} bmlg_wallpaper.jpg ${WORK_D}/usr/local/bmlg_assets/bmlg_wallpaper.jpg
	@sudo chown root:wheel ${WORK_D}/usr/local/bmlg_assets/bmlg_wallpaper.jpg
	@sudo chmod 755 ${WORK_D}/usr/local/bmlg_assets/bmlg_wallpaper.jpg
