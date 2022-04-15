.PHONY: build test clean

MAIN_FILE=ExampleHomework.m4
BUILD_FILE=build/ExampleHomework.rkt

build:
	mkdir -p build
	m4 ${MAIN_FILE} > ${BUILD_FILE}
	
	# Remove comments
	sed -i '/;.*$$/d' ${BUILD_FILE}
	sed -z -i 's/#|.*|#//g' ${BUILD_FILE}
	
	# Remove empty lines
	sed -i '/^[[:space:]]*$$/d' ${BUILD_FILE}
	
	# Remove spaces around parens
	sed -i 's/[[:space:]]*(/(/g' ${BUILD_FILE}
	sed -i 's/)[[:space:]]*/)/g' ${BUILD_FILE}
	
	# Remove spaces in new-lines.
	sed -i 's/^[[:space:]]*//g' ${BUILD_FILE}
	
	# The scary part -- replace newlines with spaces.
	tr '\n' ' ' < ${BUILD_FILE} > ${BUILD_FILE}.tr
	mv ${BUILD_FILE}.tr ${BUILD_FILE}

test: build
	/home/marko/Desktop/321-runner/bin/rkt-test.sh ${BUILD_FILE}

clean:
	rm -r build
