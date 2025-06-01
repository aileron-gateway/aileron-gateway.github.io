
# See the package.json of the docsy to check minimum hugo version.
# https://github.com/google/docsy/blob/main/package.json
HUGO_VERSION:=0.147.5
DOCSY_VERSION:=v0.12.0

.PHONY: install-tools
install-tools:
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
	sudo dpkg -i hugo.deb
	sudo snap install dart-sass

.PHONY: install-npm-packages
install-npm-packages:
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	# npm install --save-dev autoprefixer postcss-cli postcss
	npm install
	cd themes/docsy/ && git fetch --tags && git checkout tags/$(DOCSY_VERSION)
	cd themes/docsy/ && npm install
