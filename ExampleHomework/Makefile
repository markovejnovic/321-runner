.PHONY: build test clean

MAIN_FILE=ExampleHomework.m4

build:
	mkdir -p build
	m4 ${MAIN_FILE} > build/ExampleHomework.rkt

test: build
	/home/marko/Desktop/School/CS321/Homework/bin/rkt-test.sh build/ExampleHomework.rkt

clean:
	rm -r build
