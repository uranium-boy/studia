cmake_minimum_required(VERSION 3.29)
project(lab2_bufor)

set(CMAKE_CXX_STANDARD 20)

add_executable(lab2_bufor main.cpp
        Bufor.cpp
        Bufor.h
        MeanBuffer.cpp
        MeanBuffer.h
        MaxBuffer.cpp
        MaxBuffer.h)
