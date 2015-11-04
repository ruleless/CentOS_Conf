LIBDIR:=../../lib
INCDIR:=../cppunit/include:$(LIBDIR)

VPATH:=$(INCDIR)

CC:=clang++
CXX:=clang++
CXXFLAGS:=-g -Wall -I $(subst :, -I ,$(INCDIR))
LDFLAGS:=-L $(LIBDIR) -lsnail -lrt -lcppunit -lpthread

.Phony:all lib clean
all:lib

lib:
cd $(LIBDIR) && $(MAKE)

:.o
$(CXX) $^ $(LDFLAGS) -o $@

.o:.cpp

clean:
rm *.o
