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
TARGET0 = bookcat
TARGET1 = repd
TARGETS = repd bookcat
all: $(TARGETS)
.PHONY: clean
obj/$(TARGET0)$(OEXE): src/bookcat.f
	$(FC) -c   $< -o obj/bookcat$(OEXE) $(FFLAGS)
$(TARGET0): obj/bookcat$(OEXE)
	$(FC) -o bookcat $< $(LDFLAGS)
obj/$(TARGET1)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET1): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
TARGET2 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET2)$(OEXE): $(SRCDIR)$(TARGET2).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET2)$(OEXE) 
$(TARGET2)$(EEXE): $(OBJDIR)$(TARGET2)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET2)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET2).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS) stdio *.dat *.csv fort.* *.log
distclean: clean
	$(RM) $(BINDIR)* Makefile*
