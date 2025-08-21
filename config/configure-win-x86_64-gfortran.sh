#/usr/bin/env bash
echo "generating total makefile ..." >&2
a=0;t=0;OBJDIR='src/';OEXE=.o;EEXE='';TARGETS=
echo 'FC=gfortran -g -O2'
echo 'EEXE = '
echo 'OEXE = .o'
echo 'SRC = $(wildcard src/*.f)'
echo 'OBJ = obj/*$(OEXE)'
echo 'FFLAGS = '
echo 'LDFLAGS = -Llib'
echo 'SRCDIR = src/'
echo 'OBJDIR = obj/'
echo 'BINDIR = bin/'
echo 'RM = del /Q /D'
echo 'MV = move'

for t in $(ls -1 src/*.f)
do
	TARGET=$(basename ${t%.*})
	echo 'TARGET'$a = $TARGET
	TARGETS="$TARGET $TARGETS"
	a=$(($a+1)) 
done
	echo 'TARGETS' = $TARGETS
	echo 'all: $(TARGETS)'
a=0
for s in $(ls -1 src/*.f)
do
	TARGET=$(basename ${s%.*})
	echo 'obj/$(TARGET'$a').o: src/'$TARGET'.f'
	echo -e "\t"'$(FC) -c   $< -o obj/'$TARGET'.o $(FFLAGS)'
	if [[ $TARGET != "analysis" ]]
	then
		echo '$(TARGET'$a'): obj/'$TARGET'.o'
		echo -e "\t"'$(FC) -o '$TARGET' $< $(LDFLAGS)'
	else
		echo 'analysis:'
	fi
	a=$(($a+1)) 
done
	echo 'echo created all targets' >&2
	echo 'install: all'
	echo -e '\tmv $(TARGETS) $(BINDIR)'
	echo 'clean:'
	echo -e "\t"'$(RM) $(OBJ) *.exe *.ps *.log'
	echo 'cleanall: clean'
	echo 'distclean: clean'
	echo -e "\t"'$(RM) $(BINDIR)* Makefile'
	echo 'plot: gplot.sh rain.plt rain.exe'
	echo -e "\t rain"
	echo -e "\t gpw.bat"
	echo "generating dirs" >&2
if ! test -d bin; then mkdir  bin; fi
if ! test -d obj; then mkdir  obj; fi
