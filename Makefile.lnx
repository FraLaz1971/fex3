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
TARGET2 = rain
TARGET3 = repd
TARGETS = repd rain exams bookcat
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
obj/$(TARGET2)$(OEXE): src/rain.f
	$(FC) -c   $< -o obj/rain$(OEXE) $(FFLAGS)
$(TARGET2): obj/rain$(OEXE)
	$(FC) -o rain $< $(LDFLAGS)
obj/$(TARGET3)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET3): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
TARGET4 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET4)$(OEXE): $(SRCDIR)$(TARGET4).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET4)$(OEXE) 
$(TARGET4)$(EEXE): $(OBJDIR)$(TARGET4)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET4)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET4).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS) stdio *.dat *.csv fort.* *.log
distclean: clean
	$(RM) $(BINDIR)* Makefile*
