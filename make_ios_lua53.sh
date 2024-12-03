#!/bin/bash
# 创建构建目录并进入
mkdir -p build_ios && cd build_ios

# 运行 cmake 配置命令，并设置最低 iOS 部署版本为 12.0
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake \
      -DPLATFORM=OS64 \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0 \  # 设置最低部署版本为 12.0
      -G "Xcode" ../  # 使用双引号将 Xcode 包裹起来，避免可能的空格问题

# 返回原目录
cd ..

# 构建项目并设置为 Release 配置
cmake --build build_ios --config Release --verbose

# 复制构建后的库文件到目标目录
mkdir -p plugin_lua53/Plugins/iOS/
cp build_ios/Release-iphoneos/libxlua.a plugin_lua53/Plugins/iOS/libxlua.a


