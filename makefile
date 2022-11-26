.DEFAULT: build

.PHONY: build
build:
	@echo "Building ..."
	@test -d tmp || mkdir tmp
	@echo "Loading"
	@sh src/script/xml.sh > public/feed.xml
	@sh src/script/home.sh > public/index.html
	@sh src/script/list.sh
	@sh src/script/archive.sh > public/archive.html
	@sh src/script/page.sh
	@rm -rf tmp
	@echo "Static files are saved at public/"
	@echo "\033[36mSuccess!\033[0m"
post:
	@sh src/script/write.sh
serve: build
	@python3 -m http.server --directory ./public/

