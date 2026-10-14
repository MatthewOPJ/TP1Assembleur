.code
PUBLIC trouver_prochain_different
PUBLIC supprimer_partie


trouver_prochain_different PROC

	; rcx = ptr vers le string
	; rdx = index ds le string

	mov rax, rcx			; copie du ptr vers str
	add rax, rdx			; pointeur vers le 1er char
	mov dl, [rax]			; le char a comparer

boucle_debut:
	mov r8, [rax]
	cmp r8, 0			; fin du str
	je boucle_fin

	cmp dl, [rax]			; tant que char est le meme
	jne boucle_fin

	inc rax					; inc le pointeur / index
	jmp boucle_debut		; check prochain char

boucle_fin:
	sub rax, rcx			; index a partir des ptrs, = fin - debut
	ret
trouver_prochain_different ENDP



supprimer_partie PROC
	; rcx = ptr vers str
	; rdx = index du 1er élément
	; r8 = index du dernier élément à retirer

	inc rdx						; on veut garder le 1er élément, suppression exclusive

boucle_debut:
	mov r9, [rcx + r8]
	cmp r9, 0
	je boucle_fin

	mov al, [rcx + r8]			; char a la fin
	mov [rcx + rdx], al			; remplace le char par celui a la fin

	inc r8
	inc rdx

	jmp boucle_debut

boucle_fin:
	add rcx, rdx
	mov rcx, 0			; on termine le str plus tot, car moins de chars
	ret

supprimer_partie ENDP
END
