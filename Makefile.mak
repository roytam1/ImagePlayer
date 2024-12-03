# Makefile for Borland C++ Compiler 5.5.1

DOTOBJ = .obj
DOTEXE = .exe

CXX = cl
RC = rc

CXXFLAGS = -O2 -DUNICODE=1 -D_UNICODE=1
RCFLAGS = 

OBJS = \
	build\ImagePlayerApp$(DOTOBJ)

LIBS = \
	vfw32/lib

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
	$(CXX) $(CXXFLAGS) -Fo:build\ImagePlayerApp$(DOTEXE) $(OBJS) $(LIBS)
	$(RC) $(RCFLAGS) build\ImagePlayerApp_res.res build\ImagePlayerApp$(DOTEXE)

build\ImagePlayerApp$(DOTOBJ): build $(HEADERS) ImagePlayerApp.cpp
	$(CXX) -c $(CXXFLAGS) -obuild\ImagePlayerApp$(DOTOBJ) ImagePlayerApp.cpp

build\ImagePlayerApp_res.res: resource.h ImagePlayerApp_res.rc
	$(RC) -r $(RCFLAGS) -fobuild\ImagePlayerApp_res.res ImagePlayerApp_res.rc
