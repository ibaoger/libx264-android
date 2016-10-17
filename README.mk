#libx264-android
libx264 for android NDK

## 简介 ##
使用脚本编译生成适用于 android 平台的 libx264 动态/静态库；

## 编译 ##
### 编译依赖 ###
此项目的编译脚本 build.sh 默认使用 Android NDK Standalone Toolchain 作为工具包。

**Standalone Toolchain工具制作方法**
注：此处使用 android sdk r21
在本地安装好 android ndk，路径为 $ANDROID_NDK，使用下面的命令生成ARM 32位版本的工具，
```
$ANDROID_NDK/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --toolchain=arm-linux-androideabi-4.8 --system=linux-x86_64 --install-dir=$HOME/arm
```

### 编译命令 ###
sh build.sh

生成结果位于 libs/*

### 使用方法 ###
拷贝 libs/ 到新项目中，如果新项目使用 ndk-build 作为编译工具，请在 Application.mk 中添加 APP_PLATFORM := android-21，否则会出现未知错误。

## 遗留 ##
虽然已经实现了对所有 ABI 的支持，但是，x264 configure脚本内部明确表示还不支持 armeabi mips mips64 的汇编优化；
因此x264在这三种ABI下运行的效率要低很多，官方甚至建议不要使用，这里为了更好的兼容性，全部启用。

如果你的 APP_PLATFORM := android-16，请使用 ABI32 分支的代码。
