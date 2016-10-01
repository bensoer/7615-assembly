#include <iostream>
#include <deque>
#include <climits>
#include <map>
#include <algorithm>

using namespace std;

/**
 * convertDecimalToHex converts the passed in integer value and converts it to the equivelent hex value as a string
 * @param decimal int - The deciman value to be converted
 * @return String - the hex value as a string
 */
string convertDecimalToHex(int decimal){

    //setup a map of the decimal value and what its hex string value should be
    map<int, char> hexMap {
            {0 , '0'},
            {1, '1'},
            {2, '2'},
            {3, '3'},
            {4, '4'},
            {5, '5'},
            {6, '6'},
            {7, '7'},
            {8, '8'},
            {9, '9'},
            {10, 'A'},
            {11, 'B'},
            {12, 'C'},
            {13, 'D'},
            {14, 'E'},
            {15, 'F'}
    };

    //store all of the remainder values as these will be the values being converted to hex strings with the map
    deque<int> * remainders = new deque<int>();


    int whole = decimal;
    int remainder = INT_MAX;

    //loop through dividing out the integer into base 16 numbers. storing the remainders in the deque
    do{

        cout << "Now Looping" << endl;
        remainder = whole % 16;
        whole = whole / 16;

        cout << "Whole Is: " << whole << ". Remainder Is: " << remainder << endl;

        remainders->push_back(remainder);


    }while(whole > 0);

    cout << "NOW GENERATING HEX" << endl;

    string hexString;
    //now create the hex string with the map and the remainders
    for_each(remainders->rbegin(), remainders->rend(), [&hexMap, &hexString](int remainder){
        cout << "Remainder Is: " << remainder << endl;
        char mapLetter = hexMap.at(remainder);

        cout << "Map Letter Is: " << mapLetter << endl;
        hexString += mapLetter;
    });

    return hexString;
}


/**
 * main entrance of the program
 * @return int - status of the failure or successful execution of the program
 */
int main() {

    //***********************************************
    //          The Integer To Be Converted         *
    //***********************************************
    int integer = 436;

    //carry out conversion procedure
    cout << "Original Integer: " << integer << endl;
    string hexValue = convertDecimalToHex(integer);
    cout << "Hex Value: " << hexValue << endl;

    return 0;

}