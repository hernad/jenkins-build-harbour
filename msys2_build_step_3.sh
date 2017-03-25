#!/bin/bash

echo $PATH


export PATH=/c/msys32/mingw32/bin:C:\hbwin\bin:/mingw32/bin:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:/c/ProgramData/Oracle/Java/javapath
export PATH=$PATH:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0
#export PATH=$PATH:/c/Program Files (x86)/Windows Kits/10/Windows Performance Toolkit:/c/Program Files (x86)/nodejs
#export PATH=$PATH:/c/Program Files (x86)/Java/jdk1.8.0_72/bin

#/c/Program Files (x86)/Microsoft SDKs/TypeScript/1.0:%SystemRoot%/system32:%SystemRoot%:%SystemRoot%/System32/Wbem:%SYSTEMROOT%/System32/WindowsPowerShell/v1.0:/c/Users/Ernad/AppData/Roaming/npm:/c/Users/Ernad/AppData/Local/atom/bin:/c/Program Files (x86)/Microsoft VS Code/bin:/c/hbwin/bin:/c/tools/apache-maven-3.3.3/bin:/c/knowhowERP/util:/c/knowhowERP/lib:%USERPROFILE%/AppData/Local/Microsoft/WindowsApps:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

echo msys2 build step 3

echo == g drive for data ===
cd /g
git clone https://github.com/hernad/harbour-core.git
cd harbour-core
git checkout my-master -f
git pull
./win-make.exe

