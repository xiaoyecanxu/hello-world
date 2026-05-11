# Branch

test

## C++ Hello World

这个仓库现在包含一个最基础的 C++ Hello World 示例程序，并新增了 `CMakeLists.txt`，可在 Linux/macOS/Windows 等多环境中统一构建。

### 使用 CMake 构建（推荐）

```bash
cmake -S . -B build
cmake --build build
```

运行程序：

```bash
./build/hello
```

> Windows + Visual Studio 生成器下，默认可执行文件通常位于 `build/Debug/hello.exe`。

### 手动编译（可选）

```bash
g++ -std=c++17 main.cpp -o hello
./hello
```
