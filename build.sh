#!/bin/sh

#############################################################
#
# 注：
#    此处默认使用 $ANDROID_NDK/platforms/android-21 版本，
#    如果项目中有使用到 ndk-build 工具，请在 Application.mk 中
#    添加 APP_PLATFORM := android-21
#
#############################################################

cd jni

### armeabi-v7a ###
TOOLCHAINS=$HOME/Documents/app/Android-NDK-Toolchain
SYSROOT=$TOOLCHAINS/arm/sysroot
CROSS_PREFIX=$TOOLCHAINS/arm/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon -mthumb -D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/armeabi-v7a

./configure --prefix=$PREFIX \
        --host=arm-linux-androideabi \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash

make clean
make STRIP= -j8 install || exit 1
