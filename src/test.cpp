#include "encoder/encoder.h"
#include "decoder/decoder.h"
#include <iostream>

/*void test(std::string input_text) {
//	std::cout<<"Testing Caesar cipher. "<<std::endl;
//	std::cout<<"Enter the text for encoding: ";
//	std::string input_text;
//	std::getline(std::cin, input_text);
	std::cout<<"Encoding text is: "<<Caesar_encoder(input_text)<<std::endl;
        
	std::string code = Caesar_encoder(input_text);
	std::cout<<"Decoding text is: "<<Caesar_decoder(code)<<std::endl;
	std::string expected_result = Caesar_decoder(code);
	if (input_text == expected_result ) {
        std::cout << "it's work"<< std::endl; }
    else {
        std::cout << "the test is failed" << std::endl; }
}*/



void test(std::string input_text) {
    	std::cout<<"_____Testing Caesar cipher_____"<<std::endl;
	std::string code = Caesar_encoder(input_text);
	//std::cout<<"Decoding text is: "<<Caesar_decoder(code)<<std::endl;
	std::string expected_result = Caesar_decoder(code);
        if (input_text == expected_result ) {
        std::cout << "it's work"<< std::endl; }
    else {
        std::cout << "the test is failed" << std::endl; }
}

