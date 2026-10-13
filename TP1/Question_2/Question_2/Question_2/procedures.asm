.data
	chaine db "Allo", 0
	

.code

PUBLIC voyelles_egale_consonnes


voyelles_egale_consonnes PROC
	
	lea rsi, chaine						; charge l'adresse de la chaine dans le registre rsi
	xor rax, rax						; initialise le compteur à 0

	compteur:
		cmp byte ptr [rsi], 0			; compare le caractère actuel avec le caractère nul
		je fin_compteur					; si le caractère est nul, on sort de la boucle

		mov bl, byte ptr [rsi]			; charge le caractère actuel dans bl
		or bl, 32						; convertit le caractère en minuscule (si c'est une lettre majuscule)
		
		cmp bl, 'a'						; compare le caractère avec 'a'
		jl prochain_charactere
		cmp bl, 'z'						; compare le caractère avec 'z'
		jg prochain_charactere
		
		cmp bl, 'a'						
		je voyelles						
		cmp bl, 'e'
		je voyelles
		cmp bl, 'i'
		je voyelles
		cmp bl, 'o'
		je voyelles
		cmp bl, 'u'
		je voyelles
		cmp bl, 'y'
		je voyelles

		dec rax
		jmp prochain_charactere

		voyelles:
			inc rax

		prochain_charactere:
			inc rsi
			jmp compteur

	fin_compteur:
		cmp rax, 0
		je egale
		mov rax, 0
		ret

	egale:
		mov rax, 1

	ret

voyelles_egale_consonnes ENDP

END