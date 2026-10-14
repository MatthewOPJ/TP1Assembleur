includelib ucrt.lib
includelib legacy_stdio_definitions.lib
extern printf:proc


.data
	matrice DWORD 3, 8, 2, 5, 1, 7, 4, 9, 2, 6, 1, 5, 3, 8, 4, 6, 2, 7, 1, 9
	format_colonne byte "colonne %d : %d", 10, 0
	format_ligne byte "ligne %d : %d", 10, 0
.code

PUBLIC afficher_sommes_colonnes
PUBLIC afficher_sommes_lignes


afficher_sommes_colonnes PROC
	push rsi
	push rdi
	push r12
	push r13
	push r14
	sub rsp, 32

	mov r12, rcx					; ptr vers mat
	mov r13, rdx					; taille en x
	mov r14, r8						; taille en y

	xor rsi, rsi					; xx

debut_boucle_x:
	cmp rsi, r13
	jge fin_boucle_x
	
	xor rax, rax					; somme
	xor rdi, rdi					; yy

	debut_boucle_y:
		cmp rdi, r14
		jge fin_boucle_y

		mov r10, rsi
		imul r10, r14
		add r10, rdi
		add eax, dword ptr [r12 + r10 * 4]

		inc rdi
		jmp debut_boucle_y

	fin_boucle_y:
	
	lea rcx, byte ptr format_colonne	; string
	mov rdx, rsi						; index xx
	mov r8, rax							; somme
	call printf

	inc rsi
	jmp debut_boucle_x

fin_boucle_x:
	add rsp, 32
	pop r14
	pop r13
	pop r12
	pop rdi
	pop rsi
	ret

afficher_sommes_colonnes ENDP



afficher_sommes_lignes PROC
	push rsi
	push rdi
	push r12
	push r13
	push r14
	sub rsp, 32

	mov r12, rcx					; ptr vers mat
	mov r13, rdx					; taille en x
	mov r14, r8						; taille en y

	xor rsi, rsi					; yy

debut_boucle_y:
	cmp rsi, r14
	jge fin_boucle_y
	
	xor rax, rax					; somme
	xor rdi, rdi					; xx

	debut_boucle_x:
		cmp rdi, r13
		jge fin_boucle_x

		mov r10, rdi
		imul r10, r14
		add r10, rsi
		add eax, dword ptr [r12 + r10 * 4]

		inc rdi
		jmp debut_boucle_x

	fin_boucle_x:

	lea rcx, byte ptr format_ligne		; string
	mov rdx, rsi						; index xx
	mov r8, rax							; somme
	call printf

	inc rsi
	jmp debut_boucle_y

fin_boucle_y:
	add rsp, 32
	pop r14
	pop r13
	pop r12
	pop rdi
	pop rsi
	ret

afficher_sommes_lignes ENDP
END
