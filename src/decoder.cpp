#include "decoder/decoder.h"

std::string Caesar_decoder(std::string text) {
    char* ciph_text = new char;
    
    int length = 0;
    while (text[length] != '\0') {
        if (((int)text[length]>=97 && (int)text[length]<=119) || ((int)text[length]>=65 && (int)text[length]<=87)) {
            ciph_text[length]=(char)((int)text[length]+3); 
        }
        else if (((int)text[length]>=119 && (int)text[length]<=122) || ((int)text[length]>=88 && (int)text[length]<=90)) {
            ciph_text[length]=(char)((int)text[length]-23); 
        }
        else {
            ciph_text[length]=text[length]; 
        }
      length++; } // calculate word length

    ciph_text[length]='\0';
    return ciph_text;
}
