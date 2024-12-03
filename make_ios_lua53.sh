#!/bin/bash
# 创建构建目录并进入
mkdir -p build_ios && cd build_ios

# 运行 cmake 配置命令，并设置最低 iOS 部署版本为 12.0
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/ios.toolchain.cmake \
      -DPLATFORM=OS64 \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=12.0 \   # 设置最低部署版本为 12.0
      -GXcode ../
cd ..
cmake --build build_ios --config Release --verbose
mkdir -p plugin_lua53/Plugins/iOS/
cp build_ios/Release-iphoneos/libxlua.a plugin_lua53/Plugins/iOS/libxlua.a 

