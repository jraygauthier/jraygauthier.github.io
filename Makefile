MKF_DIR := $(abspath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

SRC_DIR := $(MKF_DIR)/src
SRC_TEMPLATE_DIR := $(MKF_DIR)/src/template
OUT_HTML_DIR := $(MKF_DIR)/out-html
PUB_DIR := $(MKF_DIR)/docs

.PHONY: \
  all clean \
  publish \
  html clean-html \
  html-static clean-html-static \
  publish-html \
  publish-html-static clean-pub-html-static

all: html

clean: \
  clean-html

publish: \
  publish-html

html: \
  html-static
	install -d "$(OUT_HTML_DIR)"
	pandoc \
	  --standalone \
	  --template "$(SRC_TEMPLATE_DIR)/html/default.html" \
	  --toc \
	  --from markdown --to html5 \
	  -o "$(OUT_HTML_DIR)/index.html" \
	  "$(SRC_DIR)/index.md"

clean-html: \
  clean-html-static
	rm -f "$(OUT_HTML_DIR)/index.html"
	rmdir "$(OUT_HTML_DIR)"

html-static: \
  clean-html-static
	install -d "$(OUT_HTML_DIR)"
	install -d "$(OUT_HTML_DIR)/static"
	find "$(SRC_TEMPLATE_DIR)/html/static" -mindepth 1 -maxdepth 1 -exec cp -r -t "$(OUT_HTML_DIR)/static" {} +

clean-html-static:
	rm -rf "$(OUT_HTML_DIR)/static"

preview-html:
	xdg-open "$(OUT_HTML_DIR)/index.html"

html-and-preview: \
  html
	$(MAKE) preview-html

publish-html: \
  html \
  publish-html-static
	install -d "$(PUB_DIR)"
	install "$(OUT_HTML_DIR)/index.html" "$(PUB_DIR)/index.html"

publish-html-static: \
  clean-pub-html-static
	install -d "$(PUB_DIR)"
	install -d "$(PUB_DIR)/static"
	find "$(OUT_HTML_DIR)/static" -mindepth 1 -maxdepth 1 -exec cp -r -t "$(PUB_DIR)/static" {} +

clean-pub-html-static:
	rm -rf "$(PUB_DIR)/static"

preview-pub-html:
	xdg-open "$(PUB_DIR)/index.html"

publish-html-and-preview: \
  publish-html
	$(MAKE) preview-pub-html
