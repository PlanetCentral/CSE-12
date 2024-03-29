maxIncome:
#finds the total income from the file
#arguments:a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)
    #if empty file, return 0 for both a0, a1
    bnez a1, maxIncome_fileNotEmpty # maxIncome function
    li a0, 0
    ret
 maxIncome_fileNotEmpty:
     # Start your coding from here!
    addi t0, a0, 4 
    li t1, 0 
    li t2, 0 
    addi t3, a0, 0 
    li t4, 0 
    li t5, 8 
    addi t6, a0, 0 
    maxC:
        mv a0, t0
        beq t1, a1, locateMax
    loop2:
        addi sp, sp, -32
        sw ra, 0(sp)
        sw a1, 4(sp)
        sw t0, 8(sp)
        sw t1, 12(sp)
        sw t3, 16(sp)
        sw t4, 20(sp)
        sw t5, 24(sp)
        sw t6, 28(sp)
        jal income_from_record
        lw t6, 28(sp)
        lw t5, 24(sp)
        lw t4, 20(sp)
        lw t3, 16(sp)
        lw t1, 12(sp)
        lw t0, 8(sp)
        lw a1, 4(sp)
        lw ra, 0(sp)
        addi sp, sp, 32
        bnez  t1, maxNews 
        addi t2, a0, 0 
        maxNews:
            blt a0, t2, cMaxC 
            mv t2, a0 
            add t3, t6, t4 
    cMaxC:
        addi t1, t1, 1
        mul t4, t1, t5 
        addi t0, t0, 8 
        j maxC
    locateMax:
        mv a0, t3
# End your coding here!
    ret
#######################end of maxIncome###############################################
