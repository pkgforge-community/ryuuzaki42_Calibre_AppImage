.PHONY: all

VERSION= 6.25.0

all:	
	echo "$(VERSION)"
	echo "$(VERSION)" > version

	rm -rf build/
	mkdir -p build/calibre.AppDir/
	cp calibre.desktop build/calibre.AppDir/
	curl --location -o build/calibre.AppDir/AppRun https://github.com/AppImage/AppImageKit/releases/download/continuous/AppRun-x86_64
	chmod +x build/calibre.AppDir/AppRun
	mkdir -p build/calibre.AppDir/usr/bin/
	cd build/calibre.AppDir/usr/bin/ \
	&& curl -o - https://download.calibre-ebook.com/$(VERSION)/calibre-$(VERSION)-x86_64.txz | tar -xJf -
	cp build/calibre.AppDir/usr/bin/resources/content-server/calibre.png build/calibre.AppDir
	cp README.md build/calibre.AppDir
