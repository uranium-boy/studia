cmake_minimum_required(VERSION 3.29)
project(lab4)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(lab4 main.cpp
        include/Citizen.h
        src/Citizen.cpp
        include/City.h
        src/City.cpp)
include_directories(${PROJECT_SOURCE_DIR}/include)
