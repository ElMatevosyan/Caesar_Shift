.PHONY: clean create_directories

all: clean create_directories  create_dynamic_exe 

create_dynamic_exe: lib/libencoder.so lib/libdecoder.so 
	@echo "___________________________"
	@echo "Building the project with shared library..." 
	g++ src/main.cpp -I inc/ -ldecoder -lencoder -L lib/  -o bin/dynamic_coder
	@echo "Executing the binary exe..."
	@echo "...................................."
	@LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/lib ./bin/dynamic_coder

lib/libencoder.so: obj/encoder/encoder.o
	@echo "___________________________"
	@echo "Creating a shared library for the encoder......"
	g++ -shared -fPIC -o lib/libencoder.so obj/encoder/encoder.o

lib/libdecoder.so: obj/decoder/decoder.o
	@echo "___________________________"
	@echo "Creating a shared library for the decoder..."
	g++ -shared -fPIC -o lib/libdecoder.so obj/decoder/decoder.o

obj/encoder/encoder.o:
	@echo "___________________________"
	@echo "Creating object files for the encoder..."
	g++ -c src/encoder/encoder.cpp -I inc/ -o obj/encoder/encoder.o

obj/decoder/decoder.o:
	@echo "___________________________"
	@echo "Creating object files for the decoder..."
	g++ -c src/decoder/decoder.cpp -I inc/ -o obj/decoder/decoder.o

#lib/libunit_test.a: obj/testing/test.o
#	@echo "Create a static library for test..."
#	ar cvq lib/libunit_test.a obj/testing/test.o obj/decoder/decoder.o obj/encoder/encoder.o
#obj/testing/test.o:
#	@echo "Create a object file for test..."
#	g++ -c  src/test.cpp -I inc/ -o obj/testing/test.o

create_directories:
	@echo "Creating directories lib bin obj..." 
	@mkdir -p bin lib obj/encoder obj/decoder obj/testing

clean:
	@echo "Cleaning the project..."
	@rm -rf bin lib obj
