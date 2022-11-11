.PHONY: clean create_directories

all: clean create_directories  create_exe

create_exe: lib/libunit_test.a lib/libencoder.so lib/libdecoder.so
	@echo "________________________"
	@echo "Building the project with unit_test static library..." 
	g++ src/main.cpp -L lib/ -I inc/ -Wall -lencoder -ldecoder -lunit_test -o bin/coder
	@echo "Executing the binary exe..."
	@echo "...................................."
	@LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/lib ./bin/coder

lib/libunit_test.a: obj/testing/test.o
	@echo "________________________"
	@echo "Create a static unit_test library..."
	ar cvq lib/libunit_test.a obj/testing/test.o

obj/testing/test.o:
	@echo "________________________"
	@echo "Create a object file for test..."
	g++ -c -fPIC src/test.cpp -I inc/ -o obj/testing/test.o

lib/libencoder.so: obj/encoder/encoder.o
	@echo "________________________"
	@echo "Creating a shared library for the encoder......"
	g++ -shared -fPIC -o lib/libencoder.so obj/encoder/encoder.o
lib/libdecoder.so: obj/decoder/decoder.o
	@echo "________________________"
	@echo "Creating a shared library for the decoder..."
	g++ -shared -fPIC -o lib/libdecoder.so obj/decoder/decoder.o
obj/encoder/encoder.o:
	@echo "________________________"
	@echo "Creating object files for the encoder..."
	g++ -c src/encoder/encoder.cpp -I inc/ -o obj/encoder/encoder.o
obj/decoder/decoder.o:
	@echo "________________________"
	@echo "Creating object files for the decoder..."
	g++ -c src/decoder/decoder.cpp -I inc/ -o obj/decoder/decoder.o


create_directories:
	@echo "Creating directories lib bin obj..." 
	@mkdir -p bin lib obj/encoder obj/decoder obj/testing

clean:
	@echo "Cleaning the project..."
	@rm -rf bin lib obj
