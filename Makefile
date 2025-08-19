FC=f77 -g -O2
FL=f77
EEXE = 
OEXE = .o
SRC = $(wildcard src/*.f)
OBJ = obj/*
FFLAGS = -c
FDFLAGS = -o
LDFLAGS = -Llib
SRCDIR = src/
OBJDIR = obj/
BINDIR = bin/
RM = rm -f
TARGET0 = repd
TARGETS = repd
all: $(TARGETS)
.PHONY: clean
obj/$(TARGET0)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET0): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
TARGET1 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET1)$(OEXE): $(SRCDIR)$(TARGET1).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET1)$(OEXE) 
$(TARGET1)$(EEXE): $(OBJDIR)$(TARGET1)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET1)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET1).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS) stdio *.dat *.csv fort.* *.log
distclean: clean
	$(RM) $(BINDIR)* Makefile*
