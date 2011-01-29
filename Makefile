CFLAGS=-Wall -Wextra \
        -Wundef \
        -Wnested-externs \
        -Wwrite-strings \
        -Wpointer-arith \
        -Wbad-function-cast \
        -Wmissing-declarations \
        -Wmissing-prototypes \
        -Wstrict-prototypes \
        -Wredundant-decls \
        -Wno-unused-parameter \
        -Wno-missing-field-initializers

ifeq ($(findstring MINGW, $(shell uname -s)), MINGW)
  LDLIBS=-lws2_32
endif

BINS= \
	pdb_gen \
	find_syscall \
	pup \
	fix_tar

all: $(BINS)

pup: sha1.o pup.o

clean:
	rm -f $(BINS) *~ *.o *.exe
