cmake_minimum_required(VERSION 3.10)
project(SwiftCommandLine)

set(CMAKE_CXX_STANDARD 11)

# This is useful for the code completion on modules. Especially the .build/checkouts part!
file(GLOB_RECURSE SOURCE_FILES Sources/*.swift Tests/*.swift .build/checkouts/**/*.swift Packages/*.swift public/*.html Views/*.*)

add_custom_target(SwiftCommandLine
        COMMAND swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES ${SOURCE_FILES})
