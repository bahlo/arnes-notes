BASE_DIR=$(shell pwd)
SOURCE_ORG_FILES=$(BASE_DIR)/org
EMACS_BUILD_DIR=/tmp/notes-home-build

all: org2hugo hugo

.PHONY: org2hugo
org2hugo:
	mkdir -p $(EMACS_BUILD_DIR)
	mkdir -p $(EMACS_BUILD_DIR)/.cache/org-persist
	cp -r $(BASE_DIR)/init.el $(EMACS_BUILD_DIR)
	# Build temporary minimal EMACS installation separate from the one in the machine.
	HOME=$(EMACS_BUILD_DIR) NOTES_ORG_SRC=$(SOURCE_ORG_FILES) HUGO_BASE_DIR=$(BASE_DIR) emacs -Q --batch --load $(EMACS_BUILD_DIR)/init.el --execute "(build/export-all)" --kill

.PHONY: hugo
hugo:
	hugo
	mkdir -p public/index
	mv public/index.html public/index/
