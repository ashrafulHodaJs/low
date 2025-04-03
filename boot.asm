;-------------------------------------------------------------------------------------------------------------------------------------
; Simplest Bootloader in x86 assembly which prints "Hello, World!" on the screen
; Ashraful Hoda 3rd April 2025
;-------------------------------------------------------------------------------------------------------------------------------------


[BITS 16]   ;16-Bit mode
[ORG 0x7C00]  ;BIOS Origin address

start:
        mov ah, 0x00 ; video mode
        mov al, 0x03 ; text mode
        int 0x10 ;call BIOS interupt

        lea si, msg ;load the address of msg into SI register
print:
        mov al, [si] ;mov the byte pointed by si into al registers
        cmp al, 0 ;check if al contains null pointer (0)
        je hang ; jump to "hang" if equal (al==0)

        ; print the character in al
        mov ah, 0x0E ;BIOS teletype output mode

        ;The BIOS teletype output function is a feature provided by the BIOS that allows you to print a single character to the screen in text mode.

        int 0x10 ; BIOS interrupt
        inc si ;Increment SI to point to the next byte
        jmp print ;Repeat for the next character

hang:
        jmp hang ;Infinite loop to keep the message displayed

msg db "Hello, World!", 0  ; Null-terminated string

; No idea what this is
times 510-($-$$) db 0      ; Pad the rest of the boot sector with zeros
dw 0xAA55                 ; Boot sector signature
