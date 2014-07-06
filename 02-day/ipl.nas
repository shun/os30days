;;  -*- tab-width : 4 -*-
;; myos

		ORG		0x7c00
		
;; basic parameters for FAT12 format

		JMP SHORT		entry
		DB		0x90
		DB		"HELLOIPL"		; boot sector name
		DW		512				; size of 1 sector				(should be 512)
		DB		1				; size of claster				(should be 1 sector)
		DW		1				; location of the sector		(should be 1st sector)
		DB		2				; nomber of FAT					(should be 2)
		DW		224				; size of root directory		(224 entry basically)
		DW		2880			; size of this drive			(should be 2880 sectors)
		DB		0xf0			; media type					(should be 0xf0)
		DW		9				; length of FAT area			(should be 9 sectors)
		DW		18				; nomber of sectors per 1 track (should be 18 sectors)
		DW		2				; nomber of head				(should be 2)
		DD		0				; should be 0 because no pertition this time
		DD		2880			; set the size for this drive again
		DB		0,0,0x29		; magic number
		DD		0xffffffff		; volume serial number (maybe)
		DB		"HELLO-OS   "	; disk name						(fixed 11 bytes)
		DB		"FAT12   "		; format name					(fixed 8 bytes)
		RESB	18				; reserve 18 bytes

;; program body

entry:
		MOV		AX,0			; initialize AX register (= 0)
		MOV		SS,AX			
		MOV		SP,0x7c00
		MOV		DS,AX			; initialize DS register as AX
		MOV		ES,AX			; initialize ES register as AX

		MOV		SI,msg

putloop:
		MOV		AL,[SI]
		ADD		SI,1			; increment SI
		CMP		AL,0
		JE SHORT		fin
		MOV		AH,0x0e			; display 1 charactor function
		MOV		BX,15			; color code
		INT		0x10			; call video BIOS
		JMP SHORT		putloop

fin:
		HLT						; suspend CPU untile something happen
		JMP SHORT		fin				; infinity loop

msg:
		DB		0x0a,0x0a		; CR x 2
		DB		"hello, world"	; message data
		DB		0x0a			; CR
		DB		0

		RESB	0x01fe-($-$$)	; reserve by 0x1fe

		DB		0x55,0xaa

