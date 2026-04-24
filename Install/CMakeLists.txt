cmake_minimum_required(VERSION 3.10)
project(FooProject)

add_library(FooLib foo/src/foo.cpp)

target_include_directories(FooLib PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/foo/include>
	$<INSTALL_INTERFACE:include>
)

install(TARGETS FooLib
	EXPORT FooTargets
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
	RUNTIME DESTINATION bin
	INCLUDES DESTINATION include
)

install(DIRECTORY foo/include/foo DESTINATION include)

install(EXPORT FooTargets
	FILE FooPackageTargets.cmake
	NAMESPACE Foo::
	DESTINATION lib/cmake/FooPackage
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/FooPackageConfig.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/FooPackageConfig.cmake"
	INSTALL_DESTINATION lib/cmake/FooPackage
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/FooPackageConfig.cmake"
	DESTINATION lib/cmake/FooPackage
)
