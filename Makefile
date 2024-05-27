.PHONY: clean all

SOURCE_DIR=source
OUTPUT_DIR=output
NOTES=$(addprefix ${OUTPUT_DIR}/,$(addsuffix .pdf,$(basename $(notdir $(shell find ${SOURCE_DIR} -name '*.md')))))


all: ${NOTES}
	@echo "Converted notes"

${OUTPUT_DIR}/%.pdf: ${SOURCE_DIR}/%.md ${OUTPUT_DIR}
	pandoc --data-dir=data --number-sections --from markdown --to latex --output $@ $<

${OUTPUT_DIR}:
	mkdir -p $@

clean:
	rm -rf ${OUTPUT_DIR}
