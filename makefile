.DEFAULT: build

.PHONY: build
build:
	mkdir tmp
	sh src/xml.sh > public/feed.xml
	sh src/home.sh > public/index.html
	sh src/list.sh > public/archive.html
	sh src/page.sh
	rm -rf tmp

serve: build
	python3 -m http.server 8999 --directory ./public/

