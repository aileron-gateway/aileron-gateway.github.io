
# See the package.json of the docsy to check minimum hugo version.
# https://github.com/google/docsy/blob/main/package.json
HUGO_VERSION:=0.145.0
DOCSY_VERSION:=v0.11.0

.PHONY: install-tools
install-tools:
	wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
	sudo dpkg -i hugo.deb
	sudo snap install dart-sass

.PHONY: install-npm-packages
install-npm-packages:
	# Install required https://www.docsy.dev/docs/get-started/docsy-as-module/installation-prerequisites/.
	# npm install --save-dev autoprefixer
	# npm install --save-dev postcss-cli
	# npm install --save-dev postcss
	npm install
	cd themes/docsy/ && git fetch --tags && git checkout tags/$(DOCSY_VERSION)
	cd themes/docsy/ && npm install

INCLUDED += hugo # Basename of this makefile.
.DEFAULT_GOAL := hugo-help # Basename + "-help"
################################################################################
define hugo.mk
REQUIREMENTS:
  - hugo : `hugo` command must be available.
  - go          : `go` command must be available for `hugo-install`.

TARGETS:
  - hugo-help    : show help message.
  - hugo-install : install hugo using `go install`.
  - hugo         : run hugo command with given args.
  - hugo-run     : run vulnerability check.

VARIABLES:
  - HUGO_CMD     : hugo binary path. (Default "$(GOBIN)hugo")
  - HUGO_VERSION : hugo version to install. (Default "latest")
  - HUGO_TARGET  : target of vulnerability check. (Default "./...")
  - HUGO_OPTION  : hugo command line option. (Default "")

REFERENCES:
  - https://pkg.go.dev/golang.org/x/vuln/cmd/hugo
  - https://go.dev/doc/tutorial/hugo
endef
################################################################################


HUGO_CMD ?= $(GOBIN)hugo
HUGO_VERSION ?= latest
HUGO_TARGET ?= ./...
HUGO_OPTION ?= 


##### ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #####
##                                                                            ##
#  Usage: `make hugo-help`                                              #
#  Description: Show help message.                                             #
#                                                                              #
.PHONY: hugo-help hugo.mk
hugo-help hugo.mk:
	$(info $(hugo.mk))
#______________________________________________________________________________#


##### ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #####
##                                                                            ##
#  Usage: `make hugo-install`                                           #
#  Description: Install hugo using `go install`.                        #
#                                                                              #
.PHONY: hugo-install
hugo-install:
ifeq ("hugo-install","$(MAKECMDGOALS)")
	go install "golang.org/x/vuln/cmd/hugo@$(HUGO_VERSION)"
else
ifeq (,$(shell which $(HUGO_CMD) 2>/dev/null))
	go install "golang.org/x/vuln/cmd/hugo@$(HUGO_VERSION)"
endif
endif
#______________________________________________________________________________#


##### ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #####
##                                                                            ##
#  Usage: `make hugo ARGS=""`                                           #
#  Description: Run govulcheck with given arguments.                           #
#  Examples:                                                                   #
#    make hugo ARGS="-version"                                          #
#    make hugo ARGS="-help"                                             #
#                                                                              #
.PHONY: hugo
hugo: hugo-install
	$(HUGO_CMD) $(ARGS)
#______________________________________________________________________________#


##### ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ #####
##                                                                            ##
#  Usage: `make hugo-run`                                               #
#  Description: Run vulnerability check.                                       #
#                                                                              #
.PHONY: hugo-run
hugo-run: hugo-install
	$(HUGO_CMD) $(HUGO_OPTION) $(HUGO_TARGET)
#______________________________________________________________________________#
