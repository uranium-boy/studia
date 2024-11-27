cmake_minimum_required(VERSION 3.29)
project(lab7)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_PREFIX_PATH "/usr/lib/qt6/cmake")

find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

message(STATUS "Qt found: ${QtCore_INCLUDE_DIRS}")
message(STATUS "Qt libraries: ${QtCore_LIBRARIES}")

add_executable(lab7 main.cpp)
# include_directories(${PROJECT_SOURCE_DIR}/include)
# include_directories(/usr/include/qt6)
# link_directories(/usr/lib/qt6)
target_link_libraries(lab7 Qt6::Core Qt6::Gui Qt6::Widgets)
