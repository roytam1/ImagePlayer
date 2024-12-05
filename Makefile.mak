# Makefile for Borland C++ Compiler 5.5.1

DOTOBJ = .obj
DOTEXE = .exe

CXX = cl
LD = link
RC = rc

#CXXFLAGS = -O2 -DUNICODE=1 -D_UNICODE=1
CXXFLAGS = -O2
RCFLAGS = 

OBJS = \
	build\ImagePlayerApp$(DOTOBJ)

LIBS = \
	user32.lib gdi32.lib comctl32.lib shell32.lib vfw32.lib

HEADERS = \
	MBitmapDx.hpp \
	MTextToText.hpp \
	MWindowBase.hpp \
	resource.h \
	targetver.h \

all: build\ImagePlayerApp$(DOTEXE)

build:
	if not exist build mkdir build

build\ImagePlayerApp$(DOTEXE): $(OBJS) build\ImagePlayerApp_res.res
	$(LD) -out:build\ImagePlayerApp$(DOTEXE) $(OBJS) build\ImagePlayerApp_res.res $(LIBS)

build\ImagePlayerApp$(DOTOBJ): build $(HEADERS) ImagePlayerApp.cpp
	$(CXX) -c $(CXXFLAGS) -Fobuild\ImagePlayerApp$(DOTOBJ) ImagePlayerApp.cpp

build\ImagePlayerApp_res.res: resource.h ImagePlayerApp_res.rc
	$(RC) -r $(RCFLAGS) -fobuild\ImagePlayerApp_res.res ImagePlayerApp_res.rc
