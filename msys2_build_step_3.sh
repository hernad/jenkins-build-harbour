#!/bin/bash

echo $PATH


export PATH=/c/msys32/mingw32/bin:C:\hbwin\bin:/mingw32/bin:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:/c/ProgramData/Oracle/Java/javapath
export PATH=$PATH:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0

export ACLOCAL_PATH=/mingw32/share/aclocal:/usr/share/aclocal

export MANPATH=/mingw32/share/man:/usr/local/man:/usr/share/man:/usr/man:/share/man:
export MINGW_MOUNT_POINT=/mingw32
export MSYS2='c:\msys32\mingw32'

echo msys2 build step 3

pacman --noconfirm -Sy mingw-w64-i686-curl

cd /c
rm -rf hbwin

echo == g drive for data ===
cd /g
git clone https://github.com/hernad/harbour-core.git
cd harbour-core
git checkout my-master -f
git pull


export HB_WITH_OPENSSL='c:\msys32\mingw32\include'
export HB_WITH_PGSQL='c:\msys32\mingw32\include'
export HB_ARCHITECTURE=win
export HB_COMPILER=mingw

C_ROOT=C:


HB_ROOT=$C_ROOT\\hbwin

export HB_INSTALL_PREFIX=$HB_ROOT
export HB_INC_INSTALL=$HB_ROOT\\include
export HB_LIB_INSTALL=$HB_ROOT\\lib

#export HB_WITH_MYSQL=c:\\mysql\\include
#export HB_WITH_QT=c:\\Qt\\$QT_VER\\mingw$MINGW_VER\\include
#export PATH=$MSYS2\\bin:$PATH
#export MSYS2=c:\\msys32\\mingw32
#export HB_WITH_PGSQL=$MSYS2\\include
#export HB_WITH_OPENSSL=$MSYS2\\include

#export PATH=/c/msys32/mingw32/bin:$HB_ROOT\\bin:$PATH
#HB_DBG=`cygpath -d $PWD`

export HB_WITH_QT=no
./win-make.exe

./win-make.exe install
cd /c/
tar cvfz hbwin.tar.gz hbwin
cp hbwin.tar.gz //vboxsrv/vagrant/

