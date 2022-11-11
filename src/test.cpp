#include "test.h"
#include "encoder/encoder.h"
#include "decoder/decoder.h"

#include <iostream>

void test(std::string input_text, std::string expected_result) {
        std::cout<<"_____Testing Caesar cipher_____"<<std::endl;
        if (input_text == expected_result ) { 
        std::cout << "it's work"<< std::endl; }
    else {
        std::cout << "the test is failed" << std::endl; }
}
