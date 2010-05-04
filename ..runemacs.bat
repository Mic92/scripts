@echo off
rem Wrapper to start emacs from a USB-stick on win32-machines
set HOME=%CD%\config
rem Add build tools
set PATH=%PATH%;%CD%\..\MinGW\bin
set PATH=%PATH%;%CD%\..\FPC\2.2.4\bin\i386-win32
rem Local unix tools
set PATH=%PATH%;C:\Cygwin\bin
set MANPATH=C:\Cygwin\usr\man;C:\Cygwin\usr\local\man
set SHELL=C:/Cygwin/bin/bash.exe
rem Perform the start
%CD%\bin\runemacs
