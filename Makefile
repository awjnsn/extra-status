run:
	/Applications/love.app/Contents/MacOS/love ./src

release: extra.zip

extra.zip: love-11.5-win64/extra.exe
	mv love-11.5-win64 extra
	zip -9 -r extra.zip extra/
	rm -rf extra/
	

love-11.5-win64/extra.exe: love-11.5-win64 extra.love
	cat love-11.5-win64/love.exe extra.love > love-11.5-win64/extra.exe
	rm love-11.5-win64/love.exe love-11.5-win64/*.txt extra.love

love-11.5-win64: res/love-11.5-win64.zip
	unzip $(^)

res/love-11.5-win64.zip:
	wget https://github.com/love2d/love/releases/download/11.5/love-11.5-win64.zip -O res/love-11.5-win64.zip

extra.love:
	cd src && zip -9 -r ../$(@) .
	
clean:
	- rm -rf love-11.5-win64 extra.love extra.zip extra/

.PHONY: run release clean
