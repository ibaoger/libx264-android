#!/bin/sh

#############################################################
#
# 注：
#    此处默认使用 $ANDROID_NDK/platforms/android-21 版本，此
#    版本只支持32位toolchain。
#    如果项目中有使用到 ndk-build 工具，请在 Application.mk 中
#    添加 APP_PLATFORM := android-21
#
#############################################################

cd jni

TOOLCHAINS=$HOME/Documents/app/Android-NDK-Toolchain

### armeabi-v7a ###
SYSROOT=$TOOLCHAINS/arm/sysroot
CROSS_PREFIX=$TOOLCHAINS/arm/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon -mthumb -D__ANDROID__ -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__ -D__ARM_ARCH_7R__ -D__ARM_ARCH_7M__ -D__ARM_ARCH_7S__"
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
        --enable-shared \
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


### armeabi ###
SYSROOT=$TOOLCHAINS/arm/sysroot
CROSS_PREFIX=$TOOLCHAINS/arm/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv5te -msoft-float -D__ANDROID__ -D__ARM_ARCH_5TE__ -D__ARM_ARCH_5TEJ__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/armeabi

./configure --prefix=$PREFIX \
        --host=arm-linux-androideabi \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --enable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash \
        --disable-asm

make clean
make STRIP= -j8 install || exit 1


### arm64-v8a ###
SYSROOT=$TOOLCHAINS/arm64/sysroot
CROSS_PREFIX=$TOOLCHAINS/arm64/bin/aarch64-linux-android-
EXTRA_CFLAGS="-march=armv8-a -D__ANDROID__ -D__ARM_ARCH_8__ -D__ARM_ARCH_8A__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/arm64-v8a

./configure --prefix=$PREFIX \
       --host=aarch64-linux-android \
       --sysroot=$SYSROOT \
       --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --enable-shared \
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


### x86 ###
SYSROOT=$TOOLCHAINS/x86/sysroot
CROSS_PREFIX=$TOOLCHAINS/x86/bin/i686-linux-android-
EXTRA_CFLAGS="-march=i686 -mtune=i686 -m32 -mmmx -msse2 -msse3 -mssse3 -D__ANDROID__ -D__i686__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/x86

./configure --prefix=$PREFIX \
        --host=i686-linux-android \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --enable-shared \
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


### x86_64 ###
SYSROOT=$TOOLCHAINS/x86_64/sysroot
CROSS_PREFIX=$TOOLCHAINS/x86_64/bin/x86_64-linux-android-
EXTRA_CFLAGS="-march=core-avx-i -mtune=core-avx-i -m64 -mmmx -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mpopcnt -D__ANDROID__ -D__x86_64__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/x86_64

./configure --prefix=$PREFIX \
       --host=x86_64-linux-android \
       --sysroot=$SYSROOT \
       --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --enable-shared \
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


### mips ###
SYSROOT=$TOOLCHAINS/mips/sysroot
CROSS_PREFIX=$TOOLCHAINS/mips/bin/mipsel-linux-android-
EXTRA_CFLAGS="-march=mips32 -mfp32 -mhard-float -D__ANDROID__ -D__mips__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/mips

./configure --prefix=$PREFIX \
        --host=mipsel-linux-android \
        --sysroot=$SYSROOT \
        --cross-prefix=$CROSS_PREFIX \
        --extra-cflags="$EXTRA_CFLAGS" \
        --extra-ldflags="$EXTRA_LDFLAGS" \
        --enable-pic \
        --enable-static \
        --enable-shared \
        --enable-strip \
        --disable-cli \
        --disable-win32thread \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac \
        --disable-lsmash \
        --disable-asm

make clean
make STRIP= -j8 install || exit 1


### mips64 ###
SYSROOT=$TOOLCHAINS/mips64/sysroot
CROSS_PREFIX=$TOOLCHAINS/mips64/bin/mips64el-linux-android-
EXTRA_CFLAGS="-march=mips64r6 -D__ANDROID__ -D__mips__"
EXTRA_LDFLAGS="-nostdlib"
PREFIX=`pwd`/../libs/mips64

./configure --prefix=$PREFIX \
       --host=mips64el-linux-android \
      --sysroot=$SYSROOT \
      --cross-prefix=$CROSS_PREFIX \
       --extra-cflags="$EXTRA_CFLAGS" \
       --extra-ldflags="$EXTRA_LDFLAGS" \
       --enable-pic \
       --enable-static \
       --enable-shared \
       --enable-strip \
       --disable-cli \
       --disable-win32thread \
       --disable-avs \
       --disable-swscale \
       --disable-lavf \
       --disable-ffms \
       --disable-gpac \
       --disable-lsmash \
       --disable-asm

make clean
make STRIP= -j8 install || exit 1
