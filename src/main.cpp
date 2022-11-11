#include "test.h"
#include "encoder/encoder.h"
#include "decoder/decoder.h"
#include <iostream>

int main(){
               
        std::cout<<"___Write a break to end the program___"<<std::endl;
        std::string input_text;             
        while(input_text != "break"){
                std::cout<<"Enter text to encode: ";
                std::getline(std::cin, input_text);
                std::cout<<"Encoding text: "<<Caesar_encoder(input_text)<<std::endl;
                std::string code = Caesar_encoder(input_text);
                std::cout<<"Decoding text: "<<Caesar_decoder(code)<<std::endl;
                std::string expected_result = Caesar_decoder(code);
        test(input_text, expected_result);
        }
             
return 0;
}

