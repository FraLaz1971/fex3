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
TARGET5 = decay
TARGET6 = dimtest
TARGET7 = directfileio
TARGET8 = es1
TARGET9 = exams
TARGET10 = loadwritearray
TARGET11 = loan
TARGET12 = marks
TARGET13 = mtables
TARGET14 = rain
TARGET15 = reduce
TARGET16 = repd
TARGET17 = stats
TARGET18 = temps
TARGET19 = testf
TARGET20 = writereadform
TARGETS = writereadform testf temps stats repd reduce rain mtables marks loan loadwritearray exams es1 directfileio dimtest decay crtpntftn77 createpoints bytes bookcat bconvert
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
obj/$(TARGET5)$(OEXE): src/decay.f
	$(FC) -c   $< -o obj/decay$(OEXE) $(FFLAGS)
$(TARGET5): obj/decay$(OEXE)
	$(FC) -o decay $< $(LDFLAGS)
obj/$(TARGET6)$(OEXE): src/dimtest.f
	$(FC) -c   $< -o obj/dimtest$(OEXE) $(FFLAGS)
$(TARGET6): obj/dimtest$(OEXE)
	$(FC) -o dimtest $< $(LDFLAGS)
obj/$(TARGET7)$(OEXE): src/directfileio.f
	$(FC) -c   $< -o obj/directfileio$(OEXE) $(FFLAGS)
$(TARGET7): obj/directfileio$(OEXE)
	$(FC) -o directfileio $< $(LDFLAGS)
obj/$(TARGET8)$(OEXE): src/es1.f
	$(FC) -c   $< -o obj/es1$(OEXE) $(FFLAGS)
$(TARGET8): obj/es1$(OEXE)
	$(FC) -o es1 $< $(LDFLAGS)
obj/$(TARGET9)$(OEXE): src/exams.f
	$(FC) -c   $< -o obj/exams$(OEXE) $(FFLAGS)
$(TARGET9): obj/exams$(OEXE)
	$(FC) -o exams $< $(LDFLAGS)
obj/$(TARGET10)$(OEXE): src/loadwritearray.f
	$(FC) -c   $< -o obj/loadwritearray$(OEXE) $(FFLAGS)
$(TARGET10): obj/loadwritearray$(OEXE)
	$(FC) -o loadwritearray $< $(LDFLAGS)
obj/$(TARGET11)$(OEXE): src/loan.f
	$(FC) -c   $< -o obj/loan$(OEXE) $(FFLAGS)
$(TARGET11): obj/loan$(OEXE)
	$(FC) -o loan $< $(LDFLAGS)
obj/$(TARGET12)$(OEXE): src/marks.f
	$(FC) -c   $< -o obj/marks$(OEXE) $(FFLAGS)
$(TARGET12): obj/marks$(OEXE)
	$(FC) -o marks $< $(LDFLAGS)
obj/$(TARGET13)$(OEXE): src/mtables.f
	$(FC) -c   $< -o obj/mtables$(OEXE) $(FFLAGS)
$(TARGET13): obj/mtables$(OEXE)
	$(FC) -o mtables $< $(LDFLAGS)
obj/$(TARGET14)$(OEXE): src/rain.f
	$(FC) -c   $< -o obj/rain$(OEXE) $(FFLAGS)
$(TARGET14): obj/rain$(OEXE)
	$(FC) -o rain $< $(LDFLAGS)
obj/$(TARGET15)$(OEXE): src/reduce.f
	$(FC) -c   $< -o obj/reduce$(OEXE) $(FFLAGS)
$(TARGET15): obj/reduce$(OEXE)
	$(FC) -o reduce $< $(LDFLAGS)
obj/$(TARGET16)$(OEXE): src/repd.f
	$(FC) -c   $< -o obj/repd$(OEXE) $(FFLAGS)
$(TARGET16): obj/repd$(OEXE)
	$(FC) -o repd $< $(LDFLAGS)
obj/$(TARGET17)$(OEXE): src/stats.f
	$(FC) -c   $< -o obj/stats$(OEXE) $(FFLAGS)
$(TARGET17): obj/stats$(OEXE)
	$(FC) -o stats $< $(LDFLAGS)
obj/$(TARGET18)$(OEXE): src/temps.f
	$(FC) -c   $< -o obj/temps$(OEXE) $(FFLAGS)
$(TARGET18): obj/temps$(OEXE)
	$(FC) -o temps $< $(LDFLAGS)
obj/$(TARGET19)$(OEXE): src/testf.f
	$(FC) -c   $< -o obj/testf$(OEXE) $(FFLAGS)
$(TARGET19): obj/testf$(OEXE)
	$(FC) -o testf $< $(LDFLAGS)
obj/$(TARGET20)$(OEXE): src/writereadform.f
	$(FC) -c   $< -o obj/writereadform$(OEXE) $(FFLAGS)
$(TARGET20): obj/writereadform$(OEXE)
	$(FC) -o writereadform $< $(LDFLAGS)
TARGET21 = stdio
$(SRCDIR)stdio.f: $(SRCDIR)stdio0.txt $(SRCDIR)stdio1.txt
	 cat $(SRCDIR)stdio0.txt $(SRCDIR)stdio.txt >$(SRCDIR)stdio.f
$(OBJDIR)$(TARGET21)$(OEXE): $(SRCDIR)$(TARGET21).f
	$(FC) $(FFLAGS) $< $(FDFLAGS) $(OBJDIR)$(TARGET21)$(OEXE) 
$(TARGET21)$(EEXE): $(OBJDIR)$(TARGET21)$(OEXE)
	$(FL) $< $(FDFLAGS) $(TARGET21)$(EEXE) $(LDFLAGS)
	$(RM) $(SRCDIR)$(TARGET21).f
install: all
	mv $(TARGETS) $(BINDIR)
clean:
	$(RM) $(OBJ) $(TARGETS) stdio fort.* *.log
cleanall: clean
distclean: clean
	$(RM) $(BINDIR)* Makefile*
