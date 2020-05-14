cmake_minimum_required(VERSION 3.17 FATAL_ERROR)
project(quick VERSION 0.1.0 LANGUAGES CXX)

# Sources
file(GLOB_RECURSE sources CONFIGURE_DEPENDS src/*.[hc]pp)

# Executable
add_executable(${PROJECT_NAME} ${sources} src/main.manifest)
target_precompile_headers(${PROJECT_NAME} PRIVATE src/main.hpp)
target_compile_definitions(${PROJECT_NAME} PRIVATE NOMINMAX WIN32_LEAN_AND_MEAN)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
target_include_directories(${PROJECT_NAME} PRIVATE src)
