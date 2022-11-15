TARGET = bin/coder
CC = @g++
MAIN = src/main.cpp
INCLUDES = -I inc/
LFLAGS = -L lib/
LIBS = lib/libunit_test.a lib/libencoder.so lib/libdecoder.so
LPATH =LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`/lib
SHARED_FLAG = -shared -fPIC
STATIC_FLAG = ar cvq
CFLAG = -c -Wall

SRC_DIR := src/
SRC := $(wildcard $(SRC_DIR)*.cpp)
OBJ_DIR := obj/
OBJ := $(PATSUBST $(SRC_DIR)%.cpp, $(OBJ_DIR)%.o, $(SRC))

.PHONY: clean create_directories
all: clean create_directories $(TARGET)

$(TARGET): $(LIBS)
	@echo "Building the project..." 
	$(CC) $(MAIN) $(LFLAGS) $(INCLUDES)  $(LIBS) -o $(TARGET)
	@echo "Executing ...................................."
	@$(LPATH) ./$(TARGET)


lib/lib%.a: $(OBJ_DIR)%.o
	@echo "Create a static unit_test library..."
	@$(STATIC_FLAG) $@ $<

$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp
	@echo "Create a object file for test..."
	$(CC) $(CFLAG) $^ $(INCLUDES) -o $@

lib/lib%.so: $(OBJ_DIR)%.o
	@echo "Creating a shared libraries..."
	$(CC) $(SHARED_FLAG) -o $@ $^

create_directories:
	@echo "Creating directories..." 
	@mkdir -p bin lib $(PREF_OBJ) 
clean:
	@echo "Cleaning the project..."
	@rm -rf $(TARGET) $(LIBS) $(PREF_OBJ)

