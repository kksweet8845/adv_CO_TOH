BINS = emu-rv32i print

CROSS_COMPILE = riscv-none-embed-
RV32I_CFLAGS = -march=rv32i -O3 -mabi=ilp32 -nostdlib

CFLAGS = -O3 -Wall -g
LDFLAGS = -lelf
METHOD ?= NOP

.PHONY: all check clean

all: $(BINS)

emu-rv32i: emu-rv32i.c
	$(CC) $(CFLAGS) -D$(METHOD) -o $@ $< $(LDFLAGS)

print: print.c
	$(CROSS_COMPILE)gcc $(RV32I_CFLAGS) -o $@ $<


clean:
	$(RM) $(BINS)