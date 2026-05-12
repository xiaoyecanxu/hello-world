#include <iostream>

#ifdef _WIN32
#include <windows.h>
#endif

int main() {
#ifdef _WIN32
    MessageBoxA(nullptr, "hello world", "Greeting", MB_OK | MB_ICONINFORMATION);
#else
    std::cout << "hello world" << std::endl;
#endif
    return 0;
}
