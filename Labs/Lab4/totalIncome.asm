totalIncome:
#finds the total income from the file
#arguments:	a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#		a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)

	#if empty file, return 0 for  a0
	bnez a1, totalIncome_fileNotEmpty # totalIncome function
	li a0, 0
	ret

totalIncome_fileNotEmpty:
	addi t0, a0, 4 # new val address
	li t1, 0 # counter
	li t2, 0 #total
	# Start your coding from here!
tsC:
	mv a0, t0  
	beq t1, a1, helloT #end if couonter greater than a1 input

loop3:
	addi sp, sp, -20
	sw ra, 0(sp)
	sw a1, 4(sp)
	sw t0, 8(sp)
	sw t1, 12(sp)
	sw t2, 16(sp)
	jal income_from_record
	lw t2, 16(sp)
	lw t1, 12(sp)
	lw t0, 8(sp)
	lw a1, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 20
	add t2, t2, a0
	addi t1, t1, 1
	addi t0, t0, 8
	j tsC
helloT:
	mv a0, t2
# End your  coding  here!	
	ret
#######################end of nameOfMaxIncome_totalIncome###############################################
