#COMP7615 - Assignment 1

A00843110
Ben Soer
BTECH Set 7D

#binary2decimal
Converts a binary number as a string to a decimal number as a string

##setup
The binary number that is converted is hardcoded into the source code. You will need to set the value in the `main()`
method. It is the first line of the method and is also commented to point it out

#decimal2hex
Converts a decimal number as an int and then converts to a hex value as a string

##setup
The decimal number that is converted is hardcoded into the source code. You will need to set the value in the `main()`
method. It is the first line fo the method and is also commented to point it out


#Compiling
You can compile with either g++ or cmake. if using gcc you have to ensure it is compiled with the C++11 flag.

To compile `binary2decimal` in g++, enter the following command from within the `binary2decimal` folder
```
g++ main.cpp --std=c++11 -o binary2decimal
```
To compile `decimal2hex` in g++, enter the following command from within the `decimal2hex` folder
```
g++ main.cpp --std=c++11 -o decimal2hex
```

To compile with `cmake`. In the same folder directory as the `CMakeLists.txt` file enter the following command into terminal
```
cmake .
make
```
If the above commands fail, try executing with administrator priveleges

This will compile everything as required. To install cmake on your system see here : https://cmake.org/install/