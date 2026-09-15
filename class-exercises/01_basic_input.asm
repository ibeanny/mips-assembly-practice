	.data
msg1:	.asciiz "Hello MIPS"
data1: 	.word 0
data2: 	.word 0
buf: 	.space 32
	
	.text 
start:			# Display Message "msg1"
	li $v0, 4       # Put the print string service code into $v0
	la $a0, msg1    # Put the string's address into $a0
	syscall         # Ask the system to perform the service
	
	li $v0, 8           # Select syscall 8: read a string
	la $a0, buf         # Tell it where to store the string
	li $a1, 32          # Tell it the available buffer size
	syscall             # Read the user's string into buf
	
	li $v0, 5          # Select syscall 5: read an integer
	syscall            # Read the integer and store it in $v0
	la $a0, data1      # Load the address of data1 into $a0
	sw $v0, 0($a0)     # Store the integer from $v0 into data1
	
	li $v0, 5          # Select syscall 5: read another integer
	syscall            # Read the second integer and store it in $v0
	la $a0, data2      # Load the address of data2 into $a0
	sw $v0, 0($a0)     # Store the integer from $v0 into data2
	
	li $v0, 10      # Select syscall 10: terminate the program
    	syscall         # Ends the program
	
