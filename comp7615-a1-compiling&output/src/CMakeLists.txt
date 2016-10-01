cmake_minimum_required(VERSION 3.6)
project(comp7615_a1)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")

set(B2D_SOURCE_FILES binary2decimal/main.cpp)
set(D2H_SOURCE_FILES decimal2hex/main.cpp)

add_executable(binary2decimal.out ${B2D_SOURCE_FILES})
add_executable(decimal2hex.out ${D2H_SOURCE_FILES})