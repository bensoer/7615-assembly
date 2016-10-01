#include <iostream>
#include <algorithm>

using namespace std;

/**
 * convertBindaryToDecimal takes a string representing a binary number and then converts it to a base 10 decimal number.
 * This is then returned as a string aswell
 * @param binary String - the binary number being converted to decimal
 * @return String - the decimal number as a string
 */
string * convertBinaryToDecimal(string binary){


    //stores the answer as each loop will add to this value whatever it calculates out to be
    unsigned long runningTotal = 0;

    //sort through each character of the binary (being either a 1 or a 0)
    for(int i = 0; i < binary.length(); i++){

        int exponent = (binary.length() - i - 1);
        char character = binary[i];

        cout << "Character Is: >" << character << "<" << endl;
        cout << "Exponent Is: >" << exponent << "<" << endl;

        //if 1 then (1 * 2 ^ i)
        if(character == '1'){
            runningTotal += (1 * pow(2, exponent));
        //elseif 0 then (0 * 2 ^ i)
        }else if(character == '0'){
            runningTotal += (0 * pow(2, exponent));
        //else somethings gone wrong. the input was invalid. Abort
        }else{
            cout << "Invalid Character In Binary String. Can't Compute!";
            return nullptr;
        }
    }

    //convert our number result to a string and return it
    string * decimal = new string(to_string(runningTotal));
    return decimal;
}

/**
 * the main entrance to the program
 * @return int - The status of whether the program has executed successfuly or not
 */
int main() {

    //******************************************
    //        The Binary To Be Converted       *
    //******************************************
    string * binary = new string("100110");

    cout << "Original Binary: " << (*binary) << endl;
    string * decimal = convertBinaryToDecimal(*binary);

    //there was an error converting. tell the people about it
    if(decimal == nullptr){
        cout << "There Was An Error Converting The Binary To A Decimal Value" << endl;
        return 0;
    }

    //otherwise assume there was no error. show the converted value and return
    cout << "Decimal Value: " << (*decimal) << endl;
    return 0;
}