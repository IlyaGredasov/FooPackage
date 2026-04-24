cmake_minimum_required(VERSION 3.10)
project(FooConsumer)

find_package(FooPackage REQUIRED)
add_executable(main main.cpp)
target_link_libraries(main PRIVATE Foo::FooLib)
