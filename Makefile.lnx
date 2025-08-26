FC=gfortran -g -O2
FL=gfortran
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
TARGET0 = bconvert
TARGET1 = bookcat
TARGET2 = bytes
TARGET3 = createpoints
TARGET4 = crtpntftn77
TARGET5 = dimtest
TARGET6 = directfileio
TARGET7 = es1
TARGET8 = exams
TARGET9 = loadwritearray
TARGET10 = loan
TARGET11 = rain
TARGET12 = reduce
TARGET13 = repd
TARGET14 = stats
TARGET15 = testf
TARGET16 = writereadform
TARGETS = writereadform testf stats repd reduce rain loan loadwritearray exams es1 directfileio dimtest crtpntftn77 createpoints bytes bookcat bconvert
all: $(TARGETS)
.PHONY: clean
obj/$(TARGET0)$(OEXE): src/bconvert.f
	$(FC) -c   $< -o obj/bconvert$(OEXE) $(FFLAGS)
$(TARGET0): obj/bconvert$(OEXE)
	$(FC) -o bconvert $< $(LDFLAGS)
obj/$(TARGET1)$(OEXE): src/bookcat.f
	$(FC) -c   $< -o obj/bookcat$(OEXE) $(FFLAGS)
$(TARGET1): obj/bookcat$(OEXE)
	$(FC) -o bookcat $< $(LDFLAGS)
obj/$(TARGET2)$(OEXE): src/bytes.f
	$(FC) -c   $< -o obj/bytes$(OEXE) $(FFLAGS)
$(TARGET2): obj/bytes$(OEXE)
	$(FC) -o bytes $< $(LDFLAGS)
obj/$(TARGET3)$(OEXE): src/createpoints.f
	$(FC) -c   $< -o obj/createpoints$(OEXE) $(FFLAGS)
$(TARGET3): obj/createpoints$(OEXE)
	$(FC) -o createpoints $< $(LDFLAGS)
obj/$(TARGET4)$(OEXE): src/crtpntftn77.f
	$(FC) -c   $< -o obj/crtpntftn77$(OEXE) $(FFLAGS)
$(TARGET4): obj/crtpntftn77$(OEXE)
	$(FC) -o crtpntftn77 $< $(LDFLAGS)
obj/$(TARGET5)$(OEXE): src/dimtest.f
	$(FC) -c   $< -o obj/dimtest$(OEXE) $(FFLAGS)
$(TARGET5): obj/dimtest$(OEXE)
	$(FC) -o dimtest $< $(LDFLAGS)
obj/$(TARGET6)$(OEXE): src/directfileio.f
	$(FC) -c   $< -o obj/directfileio$(OEXE) $(FFLAGS)
$(TARGET6): obj/directfileio$(OEXE)
	$(FC) -o directfileio $< $(LDFLAGS)
obj/$(TARGET7)$(OEXE): src/es1.f
	$(FC) -c   $< -o obj/es1$(OEXE) $(FFLAGS)
$(TARGET7): obj/es1$(OEXE)
	$(FC) -o es1 $< $(LDFLAGS)
obj/$(TARGET8)$(OEXE): src/exams.f
	$(FC) -c   $< -o obj/exams$(OEXE) $(FFLAGS)
$(TARGET8): obj/exams$(OEXE)
	$(FC) -o exams $< $(LDFLAGS)
obj/$(TARGET9)$(OEXE): src/loadwritearray.f
	$(FC) -c   $< -o obj/loadwritearray$(OEXE) $(FFLAGS)
$(TARGET9): obj/loadwritearray$(OEXE)
	$(FC) -o loadwritearray $< $(LDFLAGS)
obj/$(TARGET10)$(OEXE): src/loan.f
	$(FC) -c   $< -o obj/loan$(OEXE) $(FFLAGS)
$(TARGET10): obj/loan$(OEXE)
	$(FC) -o loan $< $(LDFLAGS)
obj/$(TARGET11)$(OEXE): src/rain.f
	$(FC) -c   $< -o obj/rain$(OEXE) $(FFLAGS)
$(TARGET11): obj/rain$(OEXE)
	$(FC) -o rain $< $(LDFLAGS)
obj/$(TARGET12)$(OEXE): src/reduce.f
	$(FC) -c   $< -o obj/reduce$(OEXE) $(FFLAGS)
$(TARGET12): obj/reduce$(OEXE)
	$(FC) -o reduce $< $(LDFLAGS)
obj/$(TARGET13)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET13): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
obj/$(TARGET14)$(OEXE): src/stats.f
	$(FC) -c   $< -o obj/stats$(OEXE) $(FFLAGS)
$(TARGET14): obj/stats$(OEXE)
	$(FC) -o stats $< $(LDFLAGS)
obj/$(TARGET15)$(OEXE): src/testf.f
	$(FC) -c   $< -o obj/testf$(OEXE) $(FFLAGS)
$(TARGET15): obj/testf$(OEXE)
	$(FC) -o testf $< $(LDFLAGS)
obj/$(TARGET16)$(OEXE): src/writereadform.f
	$(FC) -c   $< -o obj/writereadform$(OEXE) $(FFLAGS)
$(TARGET16): obj/writereadform$(OEXE)
	$(FC) -o writereadform $< $(LDFLAGS)
TARGET17 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET17)$(OEXE): $(SRCDIR)$(TARGET17).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET17)$(OEXE) 
$(TARGET17)$(EEXE): $(OBJDIR)$(TARGET17)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET17)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET17).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS) stdio fort.* *.log
cleanall: clean
distclean: clean
	$(RM) $(BINDIR)* Makefile*
