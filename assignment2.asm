#William Van Leeuwen - 0697505


#while i != N{
#	if( x[i] < y[i] ){
#		Z[i] = X[i] + Y[i]
#	}
#	i++
#}

.data
	Zlist: 0 0 0 0 0 0 0 0
	Xlist: 1 2 3 4 5 6 7 8
	Ylist: 2 3 4 5 6 7 8 9	
	
.text
	#$s0 = address Z
	lui $s0,0x1001
	ori $s0,0x0000

	#$s1 = address X
	lui $s1,0x1001
	ori $s1,0x0020
	
	#$s2 = address Y
	lui $s2,0x1001
	ori $s2,0x0040
	
	
	#$s3 = N
	addi $s3, $zero, 8	#N = 8, length of array
	
	#t0 = i
	#t1 = address for Z
	#t2 = address for X
	#t3 = address for Y
loop:
	sll $t1, $t0, 2		#multiply i by 4 to access proper mem address
	sll $t2, $t0, 2	
	sll $t3, $t0, 2	
	
	add $t1, $t1, $s0	#add the mem address increment to the base address
	add $t2, $t2, $s1
	add $t3, $t3, $s2
		
	#t4 = register for Z[i]
	#t5 = register for X[i]
	#t6 = register for Y[i]
	lw $t4, 0($t1)		#load word from said memory address
	lw $t5, 0($t2)
	lw $t6, 0($t3)
		
	
	blt $t5, $t6, sum	#if x[i] < y[i] else continue into while

while:
			
	addi $t0,$t0,1		#increment i
	beq $t0, $s3,exit	#check if i = N
	j loop
	

	
			
	
sum: 
	add $t4, $t5, $t6	#add x and y into z's temp holder
	sw $t4, 0($t1)		#store it into z[i]'s mem address
	j while
	
	

exit:
	
