.code

PUBLIC Push_Fin
PUBLIC FIFO

Push_Fin PROC
    pop r11                            ; ptr de retour

    pas_egale:
        push cx
        mov rdi, rsp                  ; ptr de swap
        add rdi, 2                    ; 2e élément pour le 1er swap

    debut_boucle:
        cmp rdi, rbx
        je fin_boucle

        mov ax, WORD ptr [rdi]        ; load les deux valeurs
        mov r10w, WORD ptr [rdi - 2]    

        mov WORD ptr [rdi], r10w        ; swap
        mov WORD ptr [rdi - 2], ax

        add rdi, 2                    ; prochain élément
        jmp debut_boucle

    fin_boucle:
        push r11
        ret                            ; pas de valeur de retour
Push_Fin ENDP



FIFO PROC

    mov r9, rcx                 ; r9 = ptr vers in
                                ; rdx = ptr vers out
                                ; r8 = taille des listes
    mov rbx, rsp
    xor rsi, rsi
    
debut_push:
    mov cx, [r9 + rsi * 2]
    call Push_Fin

    inc rsi
    cmp rsi, r8
    jl debut_push

    xor rsi, rsi

debut_pop:
    pop cx
    mov WORD ptr [rdx + rsi * 2], cx
    inc rsi
    cmp rsi, r8
    jl debut_pop

    ret
FIFO ENDP

END
