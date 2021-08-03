cmake_minimum_required(VERSION 3.16)
project(toy CXX)


find_package(LLVM)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)
include(TableGen)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

find_package(MLIR)
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
include(AddMLIR)
include_directories(${MLIR_INCLUDE_DIRS})
add_definitions(${MLIR_DEFINITIONS})


add_custom_target(Toy)
# set_target_properties(Toy PROPERTIES FOLDER Examples)

macro(add_toy_chapter name)
  add_dependencies(Toy ${name})
  add_llvm_example(${name} ${ARGN})
  set_property(TARGET ${name} APPEND_STRING PROPERTY LINK_FLAGS " -fuse-ld=lld")
endmacro(add_toy_chapter name)

add_subdirectory(Ch1)
add_subdirectory(Ch2)
add_subdirectory(Ch3)
add_subdirectory(Ch4)
add_subdirectory(Ch5)
add_subdirectory(Ch6)
add_subdirectory(Ch7)
