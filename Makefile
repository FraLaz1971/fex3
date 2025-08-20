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
TARGET1 = exams
TARGET2 = repd
TARGETS = repd exams bookcat
all: $(TARGETS)
.PHONY: clean
obj/$(TARGET0)$(OEXE): src/bookcat.f
	$(FC) -c   $< -o obj/bookcat$(OEXE) $(FFLAGS)
$(TARGET0): obj/bookcat$(OEXE)
	$(FC) -o bookcat $< $(LDFLAGS)
obj/$(TARGET1)$(OEXE): src/exams.f
	$(FC) -c   $< -o obj/exams$(OEXE) $(FFLAGS)
$(TARGET1): obj/exams$(OEXE)
	$(FC) -o exams $< $(LDFLAGS)
obj/$(TARGET2)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET2): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
TARGET3 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET3)$(OEXE): $(SRCDIR)$(TARGET3).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET3)$(OEXE) 
$(TARGET3)$(EEXE): $(OBJDIR)$(TARGET3)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET3)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET3).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS)  fort.* *.log
distclean: clean
	$(RM) $(BINDIR)* Makefile*
