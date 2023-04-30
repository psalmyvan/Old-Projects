## PSALMUEL FLOATING POINT CALCULATOR
.data 0x200C
.float 1, 1, 1, 1
#.word  0x00000100, 0xff800000, 0x00000000, 0x00000000
#.float 2.125, -4.5, 36.79, 5.25
#      C	10	14	18	1C 
# 	0x2000 Xf = Xo + vt + (at^2)/2
#	0x2004 vt
# 	0x2008 (at^2)/2
# 	0x200C Xo
# 	0x2010 V
# 	0x2014 A
# 	0x2018 T
.text
main:
	lw $a0, 0x2010($0) 		# a0 = v
	lw $a1, 0x2018($0) 		# a1 = t

	jal fp_mult
	sw $v0, 0x2004($0)		# store v*t
	add $a0, $0, $a1 		# a0 = t, a1 = t

	jal fp_mult

	add $a0, $0, $v0 		# a0 = t*t
	lw $a1, 0x2014($0) 		# a1 = a

	jal fp_mult
	add $a0, $0, $v0 		# a0 = a*t*t

	jal fp_half
	sw $v0, 0x2008($0) 		# store 1/2 a*t*t
	# intermediate results calculated, add now
	lw $a0, 0x200C($0) 		# a0 = x0
	lw $a1, 0x2004($0) 		# a1 = v*t
	
	jal fp_add
	add $a0, $0, $v0 		# a0 = x0 + v*t
	lw $a1, 0x2008($0) 		# a1 = 1/2 a*t*t
	
	jal fp_add
	sw $v0, 0x2000($0) 		# x0 + v*t + 1/2 a*t*t

	j end
		
fp_mult:				################## S U B R O U T I N E ##################
	addi $t6, $t6, 1			# t6 will be used to pad
	sll $t6, $t6, 23			# hidden 1 in mantissa
# PARSE v
	srl $t0, $a0, 31			# t0 = sign of v
	sll $t1, $a0, 1	
	srl $t1, $t1, 24			# t1 = exponent of v
	sll $t2, $a0, 9
	srl $t2, $t2, 9				# t2 = mantissa of v
# PARSE t
	srl $t3, $a1, 31			# t3 = sign of t
	sll $t4, $a1, 1	
	srl $t4, $t4, 24			# t4 = exponent of t
	sll $t5, $a1, 9
	srl $t5, $t5, 9				# t5 = mantissa of t
# S P E C I A L		C A S E S
	# I N I T I A L I Z A T I O N
	addi $s0, $0, 4				# s0 = counter
a:
	addi $s2, $s2, 255
	sll $s2, $s2, 8				# s2 = 0xFFFFFFFF
	addi $s0, $s0, -1
	bne $s0, $0, a
	addi $s1, $s1, 255			#s1 = 0x000000FF
# S T A R T
	bne $s1, $t1, finite			# check if exp1 = all 1's (NaN/Inf)
		bne $t2, $0, xNaN		# check if mantissa1 != 0 (NaN), else (Inf)
		bne $t5, $0, finite		# check if mantissa2 = 0
			bne $t4, $0, finite	# check if exp2 = 0; 
xNaN:
	addu $v0, $s2, $0
	jr $ra
finite:
	bne $s1, $t4, asd				# check if exp2 = all 1's (NaN/Inf)
		bne $t5, $0, zxc			# check if mantissa2 != 0 (NaN), else(Inf)
		bne $t2, $0, asd			# check if mantissa1 = 0
			bne $t1, $0, asd		# check if exp1 = 0;
zxc:
	addu $v0, $s2, $0
	jr $ra
asd:
	addi $s7, $0, 0x7F8
	addi $s6, $0, 0xFF8
	sll $s7, $s7, 20			# s7 = +Inf
	sll $s6, $s6, 20			# s6 = -Inf
	bne $s1, $t1, qwe			# check if  exp1 = all 1's
		beq $t0, $t3, PosInf		# check if sign1 = sign2 (+Inf)
#	bne $t0, $t3, NegInf			# else (-Inf)
#NegInf:
	addu $v0, $0, $s6
	jr $ra
PosInf:
	addu $v0, $0, $s7
	jr $ra
qwe:
		addi $s0, $0, 1
		sll $s0, $s0, 31			# s0 = -sign
		bne $a0, $0, qwerty
			beq $t0, $t3, PSign
			bne $t0, $t3, NSign
NSign:
	addu $v0, $0, $s0
	jr $ra
PSign:
	addu $v0, $0, $0
	jr $ra
qwerty:
	bne $a0, $s0, asdfg
		beq $t0, $t3, PSign
		bne $t0, $t3, NSign
asdfg:
	bne $a1, $0, zxcvb
		beq $t0, $t3, PSign
		bne $t0, $t3, NSign
zxcvb:
	bne $s0, $a1, nonspecial
		beq $t0, $t3, PSign
		bne $t0, $t3, NSign
nonspecial:

#1. Determine the sign of result (XOR :D)
xor $s0, $t0, $t3	#sign bit of answer

#2. Determine the exponent of result. Add both then sub 127 for mult. 
add $s1, $t1, $t4	#exponent of answer
addi $s1, $s1, -127

#3. Perform mantissa arithmetic (similar to integers). Don�t forget the implied 1!
#RegM = $t2 RegQ = $t5 RegA = $t6
addi $t6, $0, 1		#adding implied 1 to mantissa of both inputs
sll $t6, $t6, 23
add $t2, $t2, $t6
add $t5, $t5, $t6
add $t6, $0, $0		#initializaion of RegA No need for C since RegA has extra space for carry
addi $t8, $0, 24	#set iteration counter
iteration:
	#If LSB of RegQ (q0) is 1, add multiplicand to RegA; otherwise add 0 to RegA
	andi $t7, $t5, 1	#check if LSB is 1 or 0
	beq $t7, $0, skipmult1	#add if 1, skip if 0
	add $t6, $t6, $t2
	skipmult1:
	#�Shift RegA-RegQ register to the right (LSB is shifted out)
	srl $t5, $t5, 1		#RegQ = $t5 shifting
	andi $t7, $t6, 1
	sll $t7, $t7, 23
	add $t5, $t5, $t7
	srl $t9, $t6, 24	#Is the carry bit C = 1?
	srl $t6, $t6, 1		#RegA = $t6 shifting (mantissa answer
	#�Repeat iteration n times (depends on the number of bits of multiplier). Until you exhaust all multiplier bits
	addi $t8, $t8, -1	#update counter
	bne $t8, $0, iteration	#loop

#4. Normalize the resulting mantissa if needed and remove the implied 1
clz $t7, $t6		#remove the leading 0s
sllv $t6, $t6, $t7	
sll $t6, $t6, 1 	#Remove the 1st leading 1 which is the implied 1
srl $s2, $t6, 9		#shifting mantissa to right placing

#$t7 + 1 - 9 = kukunin mong bits sa simula ni RegQ if positive
addi $t8, $t7, 1
addi $t8, $t8, -9
blez $t8, skipmult11
	sub $t8, $0, $t8
	addi $t7, $t8, 24
	srlv $t5, $t5, $t7
	add $s2, $s2, $t5	
skipmult11:

beq $t9, $0, skipmult2
addi $s1, $s1, 1	#add 1 to exponent if a C=1
skipmult2:

#5. Intermediate rounding is not allowed.
#OVERFLOW
sub $t9, $s1, $s7
bltz $t9, skipmult10	#Is the final exponent greater than or equal to an all one 8-bit exponent? If no, skip
	beq $s0, $0, skipmult12
	add $v0, $0, $s4	#Set answer as - infinity
	j endmult 
	skipmult12:
	
	add $v0, $0, $s5 	#Set answer as + infinity
	j endmult
skipmult10:

#6. collate answer in one register 
sll $s1, $s1, 23	#shifting exponent to right placing
sll $s0, $s0, 31	#shifting sign bit to right placing
add $v0, $s0, $s1	#add exponent and sign bit
add $v0, $v0, $s2	#add mantissa to both exponent and sign bit

endmult:
jr $ra
fp_half:				################## S U B R O U T I N E ##################
# PARSE a*t*t
	srl $t0, $a0, 31			# t0 = sign of v
	sll $t1, $a0, 1	
	srl $t1, $t1, 24			# t1 = exponent of v
	sll $t2, $a0, 9
	srl $t2, $t2, 9
# S P E C I A L		C A S E S
	addi $s0, $0, 4				# s0 = counter
b:
	addi $s2, $s2, 255
	sll $s2, $s2, 8				# s2 = 0xFFFFFFFF
	addi $s0, $s0, -1
	bne $s0, $0, b
	addi $s1, $s1, 255			#s1 = 0x000000FF
# S T A R T
	bne $s1, $t1, halfin			# check if exp = all 1's (NaN/Inf)
	beq $t2, $0, halfin			# check if mantissa != 0 (NaN), else infinite
#	NANskip1:
		add $v0, $0, $s6
		jr $ra
halfin:
	addi $s7, $0, 0x7F8
	addi $s6, $0, 0xFF8
	sll $s7, $s7, 20			# s7 = +Inf
	sll $s6, $s6, 20			# s6 = -Inf
	bne $s1, $t1, qwehalf			# check if  exp = all 1's
		beq $t0, $0, PInfhalf
#	bne $t0, $0, NInfhalf
#NInfhalf:
		add $v0, $0, $s6			# (-Inf)
		jr $ra
PInfhalf:
		add $v0, $0, $s7			# (+Inf)
		jr $ra
qwehalf:
		addi $s0, $0, 1
		sll $s0, $s0, 31			# s0 = -sign
		bne $a0, $0, qwertyhalf
			add $v0, $0, $0
			jr $ra
qwertyhalf:
	bne $s0, $a0, zxchalf
			add $v0, $0, $s0
			jr $ra
	
zxchalf:
	addi $t1, $t1, -1	# exp - 1 to get half
	sll $t1, $t1, 23
	sll $t0, $t0, 31
	add $v0, $t0, $t1
	add $v0, $v0, $t2
	jr $ra
fp_add:					################## S U B R O U T I N E ##################
# PARSE A U G E N D
	srl $t0, $a0, 31			# t0 = sign of augend
	sll $t1, $a0, 1	
	srl $t1, $t1, 24			# t1 = exponent of augend
	sll $t2, $a0, 9
	srl $t2, $t2, 9
	# PARSE A D D E N D
	srl $t3, $a1, 31			# t3 = sign of addend
	sll $t4, $a1, 1	
	srl $t4, $t4, 24			# t4 = exponent of addend
	sll $t5, $a1, 9
	srl $t5, $t5, 9
#SPECIAL CASE
#NAN output
addi $s6, $0, 0xFFF		#$s6 = NAN
sll $s6, $s6, 12
addi $s6, $s6, 0xFFF
sll $s6, $s6, 8
addi $s6, $s6, 0xFF
addi $s7, $0, 0xFF		#x$s7 = all 1 exponent
bne $s7, $t1, skipadd8		#Is exponent of 1st input = NAN or infinity? If no, skip
	bne $t2, $0, NANadd1	#Is mantissa of 1st input != 0? Is yes, output NAN
	bne $0, $t5, skipadd8	#Is mantissa of 2nd input = infinity? If no, skip
	beq $t0, $t3, skipadd8	#Do both inputs have the same sign? If yes, skip
	bne $t4, $s7, skipadd8	#Is exponent of 2nd input = infinity? If no, skip
	NANadd1:
		add $v0, $0, $s6
		j endadd
skipadd8:
bne $s7, $t4, skipadd9		#Is exponent of 2nd input = NAN or infinity? If no, skip
	bne $t5, $0, NANadd2	#Is mantissa of 2nd input != 0? Is yes, output NAN
	bne $0, $t2, skipadd9	#Is mantissa of 1st input = infinity? If no, skip
	beq $t3, $t0, skipadd9	#Do both inputs have the same sign? If yes, skip
	bne $t1, $s7, skipadd9	#Is exponent of 1st input = infinity? If no, skip
	NANadd2:
		add $v0, $0, $s6
		j endadd
skipadd9:

#infinity output
addi $s5, $0, 0x7F8		#$s5 = +infinity
sll $s5, $s5, 20
addi $s4, $0, 0xFF8 		#$s4 = -infinity
sll $s4, $s4, 20
bne $s7, $t1, skipadd10				#Is input 1 = infinity? If no, skip
	beq $t0, $0, positiveinfinityadd	#If input 1 is positive infinity, output = positive infinity
	bne $t0, $0, negativeinfinityadd	#If input 1 is negative infinity, output = negative infinity
	positiveinfinityadd:
		add $v0, $0, $s5
		j endmult
	negativeinfinityadd:
		add $v0, $0, $s4
		j endmult
skipadd10:

bne $s7, $t4, skipadd11				#Is input 2 = infinity? If no, skip
	beq $t3, $0, positiveinfinityadd	#If input 2 is positive infinity, output = positive infinity
	bne $t3, $0, negativeinfinityadd	#If input 2 is negative infinity, output = negative infinity
skipadd11:

#zero output
bne $t5, $t2, skipadd13			#Is mantissa input 1 = mantissa input 2? If no, skip
	xor $t6, $t0, $t3
	beq $t6, $0, skipadd13		#Is xor of signbit = 0? If yes, skip
	zeroadd:
		add $v0, $0, $0
		j endadd
skipadd13:

addi $t6, $0, 1		#adding implied 1 to mantissa of both inputs
sll $t6, $t6, 23
add $t2, $t2, $t6
add $t5, $t5, $t6

sll $t2, $t2, 6		#for further accuracy, start at the right most bit while leaving 2 spaces for carry bit
sll $t5, $t5, 6

#1. Align the operands by making the exponents equal
sub $t6, $t1, $t4	#subtract their exponents 
add $t7, $0, $t6	
bgez $t6, skipadd14
	sub $t7, $0, $t6	#makes $t7 positive if it is negative. $t7 should always be positive
skipadd14: 

bgtz $t6 skipadd1	#if $t6 is negative, $t4>$t1 therefore srl $t2 (mantissa of $t1) 
srlv $t2, $t2, $t7	#srl the mantissa of the lesser exponent
add $s1, $0, $t4	#$s1 is the exponent of the greater operand
skipadd1:
bltz $t6 skipadd2	#if $t6 is postive, $t1>$t4 therefore srl $t5 (mantissa of $t4)
srlv $t5, $t5, $t7	#srl the mantissa of the lesser exponent
add $s1, $0, $t1	#$s1 is the exponent of the greater operand
skipadd2:

#2. Look at the sign bit, that defines the operation
#3. Perform mantissa addition/subtraction

xor $t6, $t0, $t3	#xor the sign bit. if 0, (++ and --) and if 1, (--++) case
bne $t6, $0, skipadd3 	#plan for ++ and --
add $t7, $t2, $t5	#add normally 
add $s0, $0, $t0	#$s0 is the sign of either operand
skipadd3:
beq $t6, $0, skipadd4	#plan for +- or -+
	beq $t0, $0, skipadd5	#exchange operands if case -+
	add $t8, $t2, $0
	add $t2, $t5, $0
	add $t5, $t8, $0
	skipadd5:
	
	sub $t7, $t2, $t5	#sub mantissas
	add $s0, $0, $0		#default sign is +
	bgtz $t7, skipadd6	#if result is negative, make answer sign bit 1 and absolute value mantissa
	sub $t7, $0, $t7
	addi $s0, $0, 1
	skipadd6: 
skipadd4:

#4. Normalize the resulting mantissa if needed
srl $t9, $t7, 30	#checking if there is a carry bit
clz $t6, $t7		#remove the leading 0s
sllv $t7, $t7, $t6	
sll $t7, $t7, 1 	#Remove the 1st leading 1 which is the implied 1
srl $s2, $t7, 9		#shifting mantissa to right placing
beq $t9, $0, skipadd7	#add 1 to exponent if C = 1
addi $s1, $s1, 1	
skipadd7:

#5. Intermediate rounding is not allowed

#OVERFLOW
sub $t9, $s1, $s7
bltz $t9, skipadd12	#Is the final exponent greater than or equal to an all one 8-bit exponent? If no, skip
	beq $s0, $0, skipadd15
	add $v0, $0, $s4	#Set answer as -infinity
	j endadd 
	skipadd15:
	
	add $v0, $0, $s5 	#Set answer as +infinity
	j endadd
skipadd12:


# A D D		E V E R Y T H I N G
	sll $s1, $s1, 23
	sll $s0, $s0, 31
	add $v0, $s0, $s1
	add $v0, $v0, $s2

endadd:
jr $ra
end:					################## S U B R O U T I N E ##################

	# the �end� label should be the end of line
	# no instructions should be present there
