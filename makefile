
# This is the main compiler
# CXX := mips-openwrt-linux-uclibc-g++
CXX := /lede/staging_dir/toolchain-mipsel_24kc_gcc-5.4.0_musl/bin/mipsel-openwrt-linux-uclibc-g++ 
# CXX := clang --analyze # and comment out the linker last line for sanity
SRCDIR := src
INCDIR := include
BUILDDIR := build
BINDIR := bin
TARGET := $(BINDIR)/checkHumidity
 
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CXXFLAGS := -c -g # -Wall
LIB := -lrt -pthread -ldl #-pthread -lmongoclient -L lib -lboost_thread-mt -lboost_filesystem-mt -lboost_system-mt
INC := $(shell find $(INCDIR) -maxdepth 1 -type d -exec echo -I {}  \;)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	@echo " Linking..."
	@echo " $(CXX) $^ -o $(TARGET) $(LIB)"; $(CXX) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	@echo " $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<"; $(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(BINDIR)"; $(RM) -r $(BUILDDIR) $(BINDIR)

bla:
	@echo "$(BLA)"

# Tests
tester:
	$(CXX) $(CXXFLAGS) test/tester.cpp $(INC) $(LIB) -o bin/tester

# Spikes
#ticket:
#  $(CXX) $(CXXFLAGS) spikes/ticket.cpp $(INC) $(LIB) -o bin/ticket

.PHONY: clean
