	AREA SIMPLE_PROG,CODE,READONLY
		
__initenc PROC
	EXPORT __initenc
		
	ldr r1,=0x20000200

	mov r5,#0x32
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x43
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xf6
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xa8
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x88
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x5a
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x30
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x8d
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x31
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x31
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x98
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xa2
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xe0
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x37
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x07
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x34
	strb r5,[r1]
	;mov r2,#0x00
	;mov r3,#0x00
;fill_plaintext
	;strb r3,[r1,r2]
	;add r2,r2,#0x01
	;add r3,r3,#0x01
	;cmp r2,#0x10
	;bne fill_plaintext
	
	;add r1,r1,#0x20
	;mov r2,#0x00
	;mov r3,#0x01
	
	
;fill_key
	;strb r3,[r1,r2]
	;add r2,r2,#0x01
	;cmp r2,0x10
	;bne fill_key
	ldr r1,=0x20000220
	mov r5,#0x2b
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x7e
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x15
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x16
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x28
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xae
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xd2
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xa6
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xab
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xf7
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x15
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x88
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x09
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xcf
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x4f
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x3c
	strb r5,[r1]
	add r1,r1,#0x01


	;mov r2,r1
	;sub r1,r1,#0x20
	;mov r3,#0x00



		
	BX R14	
	ENDP
	END
	