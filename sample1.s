.LC0:
        .string "Please Enter the correct password: "
.LC1:
        .string "\n"
.LC2:
        .string "pas123"
.LC3:
        .string "You are successfully logged in"
.LC4:
        .string "LOCKED"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 112
        mov     edi, .LC0
        mov     eax, 0
        call    printf
        mov     rdx, QWORD PTR [rip]
        lea     rax, [rbp-112]
        mov     esi, 100
        mov     rdi, rax
        call    fgets
        lea     rax, [rbp-112]
        mov     esi, .LC1
        mov     rdi, rax
        call    strcspn
        mov     BYTE PTR [rbp-112+rax], 0
        lea     rax, [rbp-112]
        mov     esi, .LC2
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        jne     .L2
        mov     edi, .LC3
        mov     eax, 0
        call    printf
        jmp     .L3
.L2:
        mov     DWORD PTR [rbp-4], 0
        jmp     .L4
.L5:
        mov     edi, 1
        call    sleep
        mov     edi, .LC4
        call    puts  ;OR printf
        add     DWORD PTR [rbp-4], 1
.L4:
        cmp     DWORD PTR [rbp-4], 49
        jle     .L5
.L3:
        mov     eax, 0
        leave
        ret
