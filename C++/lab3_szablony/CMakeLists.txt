cmake_minimum_required(VERSION 3.29)
project(lab3_szablony_)

set(CMAKE_CXX_STANDARD 20)

include_directories(${PROJECT_SOURCE_DIR}/include)
add_executable(lab3_szablony_ main.cpp
        include/minimal.h
        src/Array.cpp
        include/Array.h)
