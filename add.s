;-----------------------------------------------------------------------------------;
;    Implementation of add WITHOUT add instruction                                  ;
;                 @Ashraful Hoda 24 Nov 2024                                        ;
;-----------------------------------------------------------------------------------;
Add:
    xor eax, eax          ; clear eax (eax = 0)
    xor eax, ebx          ; XOR operands (it will sum without carry)
    mov edx, ebx          ; copy ebx to edx for carry calculation
    and edx, ecx          ; Compute the carry (AND of ebx and ecx)

loop:
    test edx, edx         ; Check if carry (edx) is zero....test is basically "and" instruction but it only sets ZF
    jz done               ; If carry is zero then exit loop
    shl edx, 1            ; Shift carry left by 1
    xor eax, edx          ; Add carry to the sum
    mov esi, eax          ; temporarily store sum in esi
    and esi, edx          ; recalculate new carry
    mov edx, esi          ; Update carry

    jmp loop             ; loop until carry is zero

done:
    ret                   ; Return eax (result)



