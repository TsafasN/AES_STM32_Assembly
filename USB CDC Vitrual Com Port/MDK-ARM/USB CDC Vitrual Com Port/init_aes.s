	AREA SIMPLE_PROG,CODE,READONLY
		
__initenc PROC
	EXPORT __initenc
		
	PUSH    {r1-r12}
	
	ldr r1,=0x20000200

	;mov r5,#0x32
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x43
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xf6
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xa8
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x88
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x5a
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x30
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x8d
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x31
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x31
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x98
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xa2
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xe0
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x37
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x07
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x34
	;strb r5,[r1]

	mov r5,#0x00
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x11
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x22
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x33
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x44
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x55
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x66
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x77
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x88
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x99
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xaa
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xbb
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xcc
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xdd
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xee
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0xff
	strb r5,[r1]

	

	ldr r1,=0x20000220
	
	;mov r5,#0x2b
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x7e
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x15
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x16
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x28
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xae
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xd2
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xa6
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xab
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xf7
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x15
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x88
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x09
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0xcf
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x4f
	;strb r5,[r1]
	;add r1,r1,#0x01
	;mov r5,#0x3c
	;strb r5,[r1]
	;add r1,r1,#0x01

	mov r5,#0x00
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x01
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x02
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x03
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x04
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x05
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x06
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x07
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x08
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x09
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0a
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0b
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0c
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0d
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0e
	strb r5,[r1]
	add r1,r1,#0x01
	mov r5,#0x0f
	strb r5,[r1]
	add r1,r1,#0x01



	POP    {r1-r12}
	BX R14	
	ENDP
	END
	