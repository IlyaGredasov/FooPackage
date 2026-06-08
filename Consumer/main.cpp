#include <iostream>

#include "foo/foo.hpp"

int main() {
    std::cout << foo(1, 2) << std::endl;
    std::cout << foo<double>(3.0, 4.0) << std::endl;
}
