.data
    pointeur QWORD 0            ; pointeur null     


.code

	PUBLIC Push_Fin
	PUBLIC Pop_Stack

	Push_Fin PROC
        pop R8
        cmp pointeur, 0
        jne pas_egale
        mov pointeur, rsp

        pas_egale:
            push cx
            mov rsi, rsp                  ; ptr de swap
            add rsi, 2                    ; 2e élément pour le 1er swap

        debut_boucle:
            cmp rsi, pointeur
            je fin_boucle

            mov ax, WORD ptr [rsi]        ; load les deux valeurs
            mov bx, WORD ptr [rsi - 2]    

            mov WORD ptr [rsi], bx        ; swap
            mov WORD ptr [rsi - 2], ax

            add rsi, 2                    ; prochain élément
            jmp debut_boucle

        fin_boucle:
            push R8
            ret                            ; pas de valeur de retour
    Push_Fin ENDP

    Pop_Stack PROC
        pop R8
        pop ax
        push R8
        ret
    Pop_Stack ENDP

END