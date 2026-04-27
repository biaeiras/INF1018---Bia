.intel_syntax noprefix

.global mult
.global soma

.section .text

mult:
    push ebp
    mov ebp, esp

    mov eax, 0        # res = 0
    mov ecx, 0        # i = 0

    mov edx, [ebp+12] # b

loop:
    cmp ecx, edx
    jge fim

    # chamar soma(res, a)
    push dword ptr [ebp+8]
    push eax
    call soma
    add esp, 8

    inc ecx
    jmp loop

fim:
    pop ebp
    ret


soma:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    add eax, [ebp+12]

    pop ebp
    ret