length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here
li a0, 0 #counter
#if no student code provided, this function just returns 0 in a0
loop5:
 lbu t1, 0(a1)
 beqz t1, done
 addi a0, a0, 1
 addi a1, a1, 1
 j loop5
#End your coding here
done:
	ret
#######################end of length_of_file###############################################	
