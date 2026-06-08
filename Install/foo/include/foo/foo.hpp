#pragma once

int foo(int a, int b);

template <typename T>
T foo(T a, T b) {
    return a + b;
}
