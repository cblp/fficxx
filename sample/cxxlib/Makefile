NAME = libmysample.so
TARGET = lib/$(NAME)
SOURCES = src/A.cpp src/B.cpp
CPPFLAGS = -Iinclude
CXXFLAGS = -fPIC
LDFLAGS = -shared

ifeq ($(shell uname), Darwin)
	LIBNAMEFLAG = -install_name
else
	LIBNAMEFLAG = -soname
endif
LDFLAGS += -Wl,$(LIBNAMEFLAG),$(NAME)

objects = $(patsubst %.cpp, %.o, $(SOURCES))
$(TARGET): $(objects)
	mkdir -p lib
	$(CXX) $(LDFLAGS) $(objects) -o $@
