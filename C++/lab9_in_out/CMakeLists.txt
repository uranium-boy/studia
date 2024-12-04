cmake_minimum_required(VERSION 3.29)
project(lab9)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(lab9 main.cpp)
include_directories(${PROJECT_SOURCE_DIR}/include)
