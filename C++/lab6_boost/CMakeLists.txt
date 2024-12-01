cmake_minimum_required(VERSION 3.29)
project(lab6)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(lab6 main.cpp
        include/Contact.h
        include/Contacts.h
        src/Contact.cpp
        src/Contacts.cpp)
include_directories(${PROJECT_SOURCE_DIR}/include)
