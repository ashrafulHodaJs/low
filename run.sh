#!/usr/bin/env bash

if ! command -v nasm &> /dev/null; then
    echo "nasm isn't installed, install nasm first."
    exit 1
fi

if ! command -v qemu-system-i386 &> /dev/null; then
    echo "qemu-system-i386 isn't installed, install QEMU first."
    exit 1
fi

# Assembling the boot.asm file
nasm boot.asm -o boot
if [ $? -ne 0 ]; then
    echo "Error during assembing. Check your code."
    exit 1
fi

# Run the boot file using QEMU
qemu-system-i386 boot
