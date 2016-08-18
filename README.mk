libx264 for android NDK

## 简介 ##
使用脚本编译生成适用于 android 平台的 libx264 静态库；

## 编译 ##
### 编译依赖 ###
此项目的编译脚本 build.sh 默认使用 Android NDK Standalone Toolchain 作为工具包。

**Standalone Toolchain工具制作方法**
注：此处使用 android sdk r21  
在本地安装好 android ndk，路径为 $ANDROID_NDK，使用下面的命令生成ARM版本的工具，  
$ANDROID_NDK/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --toolchain=arm-linux-androideabi-4.8 --system=linux-x86_64 --install-dir=$HOME/arm

### 编译命令 ###
sh build.sh

生成结果位于 libs/*

### 使用方法 ###
拷贝 libs/*/lib/libx264.a libs/*/include 到新项目中，如果新项目使用 ndk-build 作为编译工具，请在 Application.mk 中添加 APP_PLATFORM := android-21，否则会出现未知错误。
