# income_from_record:
#function to return numerical income from a specific record
# e.g. for record "Microsoft,34\r\n", the function returns 34.

#Arguments:
# a0 contains pointer to start of array for numerical income records 
# a0 RETURNS numerical value corresponding to the ascii income (34 in our example)
    
# Start your coding from here!

.macro    nextChar
    # a0 points to next char on entry.
    lbu a1, 0(a0)       # a1 = *nextChar MACRO
    # a1 returns the byte pointed to by a0.
    addi a0, a0, 1        # nextChar++; point to new nextChar
    # a0 now points to the next byte after that one.
.end_macro

income_from_record:
    # Assumes a0 starts out with a pointer to buffer position holding an ascii 
    # version of the number
    lwu a0,0(a0)    # go indirect from the pointer of the income record to 
                    # the record itself.
    # Note, this is a leaf function, not using saved regs, so it does not need 
    # to spill any registers.
    .eqv CR 13
    .eqv TEN 10
    # nextChar will acquire the next digit.
    # Assume the ASCII digits for the amount ends in CR/LF
    # the function will return its value in a0
    # this function uses t3,t4,t6 as an interim, no worries, since it is a leaf function.
    nop          # start income_from_record function #############################
    li t3, CR   # Carriage Return
    li t4 TEN   # Value of 10
    li t6,0     # running total
    # a0 has the running address
    nextChar    # returns first ascii char, of number or a digit or CR in reg a1, 
                # a0 now points to next char
# START YOUR CODE HERE: USE PRINTING MACROS AND RARS DEBUGGER TO TROUBLESHOOT 
# YOUR PROGRAM.  Beware that macros can wipe out a0.
    li t1, 48
seeNew:
	beq a1, t3, wereClear
loop4:
	mul t6, t6, t4
	sub a1, a1, t1
	add t6, t6, a1
	nextChar
	j seeNew
wereClear:
    mv a0, t6
###### END YOUR CODE HERE, MAKE SURE YOU RETURN CORRECT BINARY NUMBER IN REGISTER a0 ####
    ret   ### end of income_from_record function ########################################
