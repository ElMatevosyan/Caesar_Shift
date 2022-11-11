#include "encoder/encoder.h"
#include "decoder/decoder.h"
#include <iostream>
int main(){
		
	std::cout<<"___Write a break to end the program___"<<std::endl;
	std::string text;
	while(text != "break"){
	std::cout<<"Enter text to encode: ";
	std::getline(std::cin, text);
	std::cout<<"Encoding text: "<<Caesar_encoder(text)<<std::endl;
	std::cout<<"Decoding text: "<<Caesar_decoder(Caesar_encoder(text))<<std::endl;
	//test(text);
}
		
return 0;
}
