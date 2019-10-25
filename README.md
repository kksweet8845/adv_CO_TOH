# Advanced CO course

## Description

Using the RISC-V RV32I[MA] emulator with ELF support which the emulator is shared on Hackaday be Frank Buss.
as a single C-file. Shaos added some additional statics and macros.


Requires libelf-dev:
```shell
$ sudo apt-get install libelf-dev
```

How to compile it:
```shell
$ gcc -O3 -Wall -lelf emu-rv32i.c -o emu-rv32i
```

Passed RV32I compliance tests from https://github.com/riscv/riscv-compliance
```shell
$ make RISCV_TARGET=spike RISCV_DEVICE=rv32i TARGET_SIM=/full/path/emulator variant
```

Compiling and running simple code:
```shell
$ riscv32-unknown-elf-gcc -O3 -nostdlib test1.c -o test1
```

or
```shell
$ riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -O3 -nostdlib test1.c -o test1
```

then
```shell
$ ./emu-rv32i test1
Hello RISC-V!
```

RV32M and RV32A instructions may be enabled by commenting `#define STRICT_RV32I`.

## Emulator rv32i

It is a emulator in order to execute the elf file and simulate the behavior of the execution environment when executing the file.

And, This file can be separated into different parts.

==Note==
You should refer to the [RISC-V ISA Manual Volume II](https://content.riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf) and [RISC-V ISA Manual Volume I](https://riscv.org/specifications/) carefully to understand the basic instruction set and some information of CSRs registers.