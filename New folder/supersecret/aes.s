	AREA SIMPLE_PROG,CODE,READONLY


__keyexp PROC
	EXPORT __keyexp
	
	ldr r10,=0x00000000
	ldr r2,=0x00000001
	mov r4,r2
	ldr r1,=0x20000220	
	
key_round	
	add r2,r1,#0x0C
	ldr r3,[r2]
	ror r3,r3,#8
		
	;;call sbox
	mov r5,r3
	
	and r3,r3,#0x000000FF
	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	strb r3,[r2,#4]
	
	mov r3,r5
	ror r3,r3,#8 
	and r3,r3,#0x000000FF
	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	strb r3,[r2,#5]
	
	mov r3,r5
	ror r3,r3,#16 
	and r3,r3,#0x000000FF
	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	strb r3,[r2,#6]
	
	mov r3,r5
	ror r3,r3,#24 
	and r3,r3,#0x000000FF
	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	strb r3,[r2,#7]
	
	ldr r3,[r2,#4]
	;; add rcon
	eor r3,r3,r4
	;; add 1st col
	ldr r5,[r1]
	eor r3,r3,r5
	;;store 1st col
	str r3,[r1,#16]
	
	;; 2nd col
	ldr r5,[r1,#4]
	eor r3,r3,r5
	str r3,[r1,#20]
	;; 3rd col
	ldr r5,[r1,#8]
	eor r3,r3,r5
	str r3,[r1,#24]
	;; 4th col
	ldr r5,[r1,#12]
	eor r3,r3,r5
	str r3,[r1,#28]
	
	add r1,r1,#16
	
	cmp r10,#0
	bne last_round
	
	add r4,r4,r4
	cmp r4,#0x80
	ble key_round
	
	mov r4,0x1b
	add r10,r10,#1
	b key_round
	
last_round
	cmp r10,#2
	beq end_key
	mov r4,0x36
	add r10,r10,#1
	b key_round
end_key	
	
	ENDP


__encr  PROC
	EXPORT __encr
	
	
;;;;;;;;;;;;;;addroundkey;;;;;;;;;;;
	ldr r1,=0x20000200	
	ldr r2,=0x20000220		
	
	STMFD sp!,{lr}
	BL __addroundkey
	LDMFD sp!,{lr}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;9 rounds;;;;;;;;;;;;;;;
	mov r10,#0x00
round_loop		
	STMFD sp!,{lr}
	BL __round
	LDMFD sp!,{lr}
	
	add r10,r10,#0x01
	cmp r10,#0x09
	bne round_loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;10th last round;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldr r1,=0x20000200 ;argument to __subbytes
	mov r2,#0x00	;counter for 128bits text (16 * 1 byte)
next_byte_last_round	
	ldrb r3,[r1,r2]

	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	
	strb r3,[r1,r2]
	
	add r2,r2,#0x01
	cmp r2,#16
	bne next_byte_last_round
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	STMFD sp!,{lr}
	BL __shiftrows
	LDMFD sp!,{lr}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldr r1,=0x20000200 ;argument to __mixcolumns
	ldr r2,=0x200002C0 ;argument to __mixcolumns
	
	STMFD sp!,{lr}
	BL __addroundkey
	LDMFD sp!,{lr}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	BX R14
	ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

__round  PROC
	EXPORT __round

	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldr r1,=0x20000200 ;argument to __subbytes
	mov r2,#0x00	;counter for 128bits text (16 * 1 byte)
next_byte	
	ldrb r3,[r1,r2]

	STMFD sp!,{lr}
	BL __subbytes
	LDMFD sp!,{lr}
	
	strb r3,[r1,r2]
	
	add r2,r2,#0x01
	cmp r2,#16
	bne next_byte
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;argument already in r1
	STMFD sp!,{lr}
	BL __shiftrows
	LDMFD sp!,{lr}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldr r1,=0x20000200 ;argument to __mixcolumns
	mov r12,#0x00	;counter for 128bits text (16 * 1 byte)
next_column

	STMFD sp!,{lr}
	BL __mixcolumns
	LDMFD sp!,{lr}
	
	add r12,r12,#0x01
	add r1,r1,#4
	cmp r12,#4
	bne next_column
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ldr r1,=0x20000200 ;argument to __mixcolumns
	ldr r2,=0x20000230 ;argument to __mixcolumns
	
	mov r9,r10
	lsl r9,#4
	add r2,r2,r9
	
	STMFD sp!,{lr}
	BL __addroundkey
	LDMFD sp!,{lr}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	BX R14
	ENDP	

__addroundkey  PROC
	EXPORT __addroundkey
		;inputs: 	r1 1st operand location
		;			r2 2nd operand location
		
	mov r3,#0

xor_128	
	ldr r4,[r1,r3]
	ldr r5,[r2,r3]
	eor r6,r4,r5
	str r6,[r1,r3]
	add r3,r3,#0x04
	cmp r3,#0x010
	bne xor_128

	BX R14
	ENDP
		
__subbytes PROC
	EXPORT __subbytes
	;input: 1 byte @r3

	ldr r8,=0x20000216
	ldr r7,[r8]
	add r6,r7,r3
	ldrb r3,[r6]
		
	BX R14
	ENDP	
		
__shiftrows  PROC
	EXPORT __shiftrows
	;input: 1 address @r1
	
	;;;row0
		;remains same	
	;;;row 1
	ldrb r2,[r1,#1]
	
	ldrb r3,[r1,#5]
	strb r3,[r1,#1]
	
	ldrb r3,[r1,#9]
	strb r3,[r1,#5]
	
	ldrb r3,[r1,#13]
	strb r3,[r1,#9]
	
	strb r2,[r1,#13]

	;;;row 2
	ldrb r2,[r1,#2]
	
	ldrb r3,[r1,#6]
	
	
	ldrb r4,[r1,#10]
	strb r4,[r1,#2]
	
	ldrb r4,[r1,#14]
	strb r4,[r1,#6]
	
	strb r2,[r1,#10]
	strb r3,[r1,#14]
	
	
	;;;row 3
	ldrb r2,[r1,#15]
	
	ldrb r3,[r1,#11]
	strb r3,[r1,#15]
	
	ldrb r3,[r1,#7]
	strb r3,[r1,#11]
	
	ldrb r3,[r1,#3]
	strb r3,[r1,#7]
	
	strb r2,[r1,#3]
	
	
	BX R14
	ENDP
		
__mixcolumns  PROC
	EXPORT __mixcolumns
	;input: 1 address @r1
	ldr r2,=0x20000300
	ldr r2,[r2]
	ldr r3,=0x20000306
	ldr r3,[r3]

	;element 1
	ldrb r4,[r1]
	ldrb r5,[r2,r4] ;mc2[r4]
	
	ldrb r4,[r1,#1]
	ldrb r6,[r3,r4] ;mc3[r4]
	
	eor r5,r5,r6
	
	ldrb r4,[r1,#2]
	eor r5,r5,r4
	
	ldrb r4,[r1,#3]
	eor r7,r5,r4 		;element 1 in r7
	;element 2
	ldrb r4,[r1,#1]
	ldrb r5,[r2,r4] ;mc2[r4]
	
	ldrb r4,[r1,#2]
	ldrb r6,[r3,r4] ;mc3[r4]
	
	eor r5,r5,r6
	
	ldrb r4,[r1]
	eor r5,r5,r4
	
	ldrb r4,[r1,#3]
	eor r8,r5,r4 		;element 2 in r8
	;element 3
	ldrb r4,[r1,#2]
	ldrb r5,[r2,r4] ;mc2[r4]
	
	ldrb r4,[r1,#3]
	ldrb r6,[r3,r4] ;mc3[r4]
	
	eor r5,r5,r6
	
	ldrb r4,[r1]
	eor r5,r5,r4
	
	ldrb r4,[r1,#1]
	eor r9,r5,r4 		;element 3 in r9
	;element 4
	ldrb r4,[r1,#3]
	ldrb r5,[r2,r4] ;mc2[r4]
	
	ldrb r4,[r1]
	ldrb r6,[r3,r4] ;mc3[r4]
	
	eor r5,r5,r6
	
	ldrb r4,[r1,#1]
	eor r5,r5,r4
	
	ldrb r4,[r1,#2]
	eor r11,r5,r4 		;element 4 in r11
	;store elements
	strb r7,[r1]
	strb r8,[r1,#1]
	strb r9,[r1,#2]
	strb r11,[r1,#3]

	
	
	BX R14
	ENDP		
		
	END