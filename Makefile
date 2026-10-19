run:
	/Applications/love.app/Contents/MacOS/love ./src

release: extra.zip

extra.zip: love-12.0-win64/extra.exe
	mv love-12.0-win64 extra
	zip -9 -r extra.zip extra/
	rm -rf extra/
	

love-12.0-win64/extra.exe: love-12.0-win64 extra.love
	cat love-12.0-win64/love.exe extra.love > love-12.0-win64/extra.exe
	rm love-12.0-win64/love.exe love-12.0-win64/*.txt extra.love

love-12.0-win64: res/love-12.0-win64.zip
	unzip $(^)

extra.love:
	cd src && zip -9 -r ../$(@) .
	
clean:
	- rm -rf love-12.0-win64 extra.love extra.zip extra/

.PHONY: run release clean
