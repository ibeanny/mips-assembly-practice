	.data
msg1: .asciiz "Hello MIPS"
	
	.text 
start:			# Display Message "msg1"
	li $v0, 4       # Put the print string service code into $v0
	la $a0, msg1    # Put the string's address into $a0
	syscall         # Ask the system to perform the service
	
	li $v0, 10      # Select syscall 10: terminate the program
    	syscall         # Ends the program
	
