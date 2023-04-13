#!/bin/bash
# Script to build a single unit test assembly or C file
# Project firmware still uses a makefile

CC="wi23-elf-gcc"
AS="wi23-elf-as"
LD="wi23-elf-ld"
OBJDUMP="wi23-elf-objdump"
OBJCOPY="wi23-elf-objcopy"

FW_UNIT_TEST=$1
OUT_DIR=$2

if [[ "$FW_UNIT_TEST" == *.s ]]; then
    $AS unit/asm/"$FW_UNIT_TEST" -o $OUT_DIR/out.o
    $LD -o $OUT_DIR/out.elf $OUT_DIR/out.o
elif [[ "$FW_UNIT_TEST" == *.asm ]]; then
    $AS unit/asm/"$FW_UNIT_TEST" -o $OUT_DIR/out.o
    $LD -o $OUT_DIR/out.elf $OUT_DIR/out.o
    rm $OUT_DIR/out.o
elif [[ "$FW_UNIT_TEST" == *.c ]]; then
    $CC -O2 -g unit/c/"$FW_UNIT_TEST" -o $OUT_DIR/out.elf
else
    echo "Error: Invalid file extension for FW_UNIT_TEST: $FW_UNIT_TEST"
    exit 1
fi

$OBJDUMP -dr -s -S $OUT_DIR/out.elf > $OUT_DIR/exec-out.log
$OBJCOPY --verilog-data-width 4 $OUT_DIR/out.elf  -O verilog $OUT_DIR/out.hex