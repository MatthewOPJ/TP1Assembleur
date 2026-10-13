.data

	liste sdword 1, -3, 6, -2	; cette liste contient 4 entiers, vous pouvez la modifier pour tester avec d'autres valeurs

.code


PUBLIC somme_max

somme_max PROC
	
	push rsi							; sauvegarder les registres utilisés
	push rbp
	push rbx
	push rdi

	xor rsi, rsi						; rsi = 0, l'indice du début du tableau
	xor rbp, rbp						; rbp = 0, pour stocker l'index de la somme maximale
	mov rax, LENGTHOF liste				; rax = longueur du tableau (...)
	dec rax								; rax = longueur du tableau - 1 (pour éviter de dépasser les limites)
	lea rdi, liste						; rdi = adresse du tableau
	
	mov ebx, 80000000H					; ebx = valeur minimale pour la somme maximale

	boucle_max:
		mov ecx, [rdi + rsi * 4]		; ecx = valeur à l'indice rsi
		mov edx, [rdi + rsi * 4 + 4]	; edx = valeur à l'indice rsi + 1
		
		add ecx, edx					; ecx = somme des deux valeurs
		cmp ecx, ebx					; comparer la somme avec la valeur maximale actuelle

		jle comparaison_boucle			; si la somme est inférieure ou égale à la valeur maximale, continuer la boucle

		mov ebx, ecx					; mettre à jour la valeur maximale si la somme est plus grande
		mov rbp, rsi					; mettre à jour l'indice de la somme maximale

	comparaison_boucle:
		inc rsi							; incrémenter l'indice
		cmp rsi, rax					; vérifier si on a atteint la fin du tableau
		jl boucle_max					; si non, continuer la boucle


	mov rax, rbp						; retourner l'indice de la somme maximale
	
	pop rdi								; restaurer les registres utilisés
	pop rbx
	pop rbp
	pop rsi

	ret
somme_max ENDP

END