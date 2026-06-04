cmake_minimum_required(VERSION 3.15)

project(hello_world VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(hello main.cpp)

if(MSVC)
  target_compile_options(hello PRIVATE /W4)
else()
  target_compile_options(hello PRIVATE -Wall -Wextra -Wpedantic)
endif()

install(TARGETS hello RUNTIME DESTINATION bin)
