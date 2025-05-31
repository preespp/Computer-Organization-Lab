############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	        # declare a zero terminate string
WordAvg:   .word 0		# use this variable for part 6
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0		# string with carriage return and line feed
InLenW:	.word   4       	# initialize to number of words in input1 and input2
InLenB:	.word   16      	# initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
Empty: .space 12	# put some empty spaces here so the starting addr of Text is clear
Text: .asciiz " \n It is exciting to watch flying fish after a hard day of work. I do not know why some fish prefer flying and other fish would rather swim. It seems like the fish just woke up one day and decided, Hey, today is the day to fly away \n "	# a big string
PrintINT:	.word 0		# variable to print int for Q2
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
	
#Code for Item 2
#Count number of occurrences of letter "a" and "e" in Text string and compute the difference between the number of occurrences

        li $t0, 0        		# counter for a
        la $t1, Text     		# load the address of Text into $t1
	addi $t1, $t1, 2		# skip first 2 character
a_loop:
        lb $t2, ($t1)   		# load $t2 with the current character of text
        beq $t2, 10, count_e 		# if it ends, go to count e
        beq $t2, 97, increment_a  	# check if it's a
        j count_a_continue		# if not, move to next character

increment_a:
        addi $t0, $t0, 1  		# increment a counter

count_a_continue:

        addi $t1, $t1, 1  		# move to the next character
        j a_loop

count_e:
        li $t3, 0        		# counter for e
        la $t1, Text     		# reload the address of Text into $t1
	addi $t1, $t1, 2		# skip first 2 character

e_loop:
        lb $t2,  ($t1)   		# load $t2 with current character of text
        beq $t2, 10, print_difference   # if it ends, go to calculate difference step
        beq $t2, 101, increment_e  	# check if it's e
        j count_e_continue      	# if not, move to next character

increment_e:
        addi $t3, $t3, 1  		# increment e counter

count_e_continue:
        addi $t1, $t1, 1  		# move to the next character
        j e_loop

print_difference:
        sub $t4, $t0, $t3  		# difference between a and e
	sub $t5, $t3, $t0
	ble $t4, $t5, e_more_a		# check which one is negative (2 complement for this small negative number will be more than the positive in binary)
	j a_more_e
a_more_e:	
	sw $t4, PrintINT		# store answer in PrintINT
	lb $a0, PrintINT 	 	# address of integer to print
        li $v0, 1        		# system call code for print
        syscall				# print the integer of difference
	j Item3
e_more_a:	
	sw $t5, PrintINT		# store answer in PrintINT
	lb $a0, PrintINT 	 	# address of integer to print
        li $v0, 1        		# system call code for print
        syscall				# print the integer of difference
	j Item3

Item3:	
################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 5 and less than AnInt
#

        li $t0, 5         		# start value
        lb $t1, AnInt     		# load AnInt value

print_integers:
	sw $t0, PrintINT
	lb $a0, PrintINT       		# load address of current integer to print
        li $v0, 1	  		# print the integer
	syscall
	la $a0, space     		# load address of space
        li $v0, 4         		# system call code for print_str
        syscall		  		# print the string 
        addi $t0, $t0, 1  		# increment value
        blt $t0, $t1, print_integers  	# if t0 < AnInt, go back to repeat process


###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte less than 4 in the array Input1 (with spaces)
#

        la $t0, Input1    		# load the address of Input1
        li $t1, 0       	 	# number of bytes in Input1
	lw $t7, InLenB			# number of bytes 

read_bytes:
        beq $t1, $t7, Item5	  	# if no more bytes, exit loop
        lb $t2, ($t0)    		# load the byte at the current address
        sw $t2, PrintINT                # store word in PrintINT
	lb $a0, PrintINT                # load value in $a0
        bge $a0, 4, read_byte_continue  # skip if more than or equal 4
	sw $t2, PrintINT
	lb $a0, PrintINT     		# load current byte to print
        li $v0, 1         		# system call for print integer
        syscall				# print 
	la $a0, space     		# load address of space
        li $v0, 4         		# system call code for print string
        syscall				# print space

read_byte_continue:
        addi $t0, $t0, 1  		# move to the next byte
        addi $t1, $t1, 1  		# increment counter
        j read_bytes
	
#################################################################################
Item5:	
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#
        la $t0, Input2    		# load the address of Input2
        la $t1, Copy      		# load the address of Copy
        li $t2, 0         		# counter number of words in Input2
        lw $t7, InLenW                  # load number of words in Input2

copy_contents:
        bge $t2, $t7, Item6		# if no more words, exit loop
        lw $t3, ($t0)    		# load the word from Input2
        sw $t3, ($t1)    		# store the word from Input2 to Copy
        addi $t0, $t0, 4  		# move to the next word in Input2
        addi $t1, $t1, 4  		# move to the next word in Copy
        addi $t2, $t2, 1  		# increment counter
        j copy_contents

Item6:	
#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the integer average of squares of the contents of array Input1
#
        la $t0, Input1                  # load the address of Input1
        li $t1, 0                       # counter
        li $t2, 0                       # sum(hi) = 0
        li $t3, 0                       # sum(lo) = 0
        lw $t7, InLenB                  # number of bytes in input1

compute:
        bge $t1, $t7, print_compute     # if no more words, exit loop
        lb $t4, ($t0)    	        # load the byte from Input1                
        mult $t4, $t4  	                # square the value
        mfhi $t5
        mflo $t6
        add $t2, $t2, $t5  	        # add to the sum(hi) [overflow checking 
                                        # since we multiply 8 bits with 8 bits= 16 bits but we have 32-bit register; there is no overflow]
        add $t3, $t3, $t6               # add to the sum(lo) [result]
        addi $t0, $t0, 1   	        # move to the next byte in Input1
        addi $t1, $t1, 1   	        # increment counter
        j compute 

print_compute:
        div $t3, $t1       	# divide sum by the number of elements
        mfhi $t2                # remainder
        mflo $t7           	# get the quotient
        sw $t7, PrintINT        # store to print integer
	lb $a0, PrintINT      	# load the average to print
        li $v0, 1          	# system call code for print integer
        syscall			# print the average


#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 10 integers that are divisible by either 7 and 13 (with space)
#

        li $t0, 0         		# counter
	li $t1, 1			# number
        li $t6, 7                       # constant as 7
        li $t7, 13                      # constant as 13

check_numbers:
        bge $t0, 10, Item8  		# if printed 10 numbers, exit loop
        div $t1, $t6        		# check if divisible by 7
        mfhi $t3          		# remainder in $t3
        beq $t3,0, print_number  	# if divisible by 7, print the number
        div $t1, $t7       		# check if divisible by 13
        mfhi $t3          		# remainder in $t1
        beq $t3,0, print_number  	# if divisible by 13, print the number
        j increment_number		# skip print if not divisible by both 7 and 13

print_number:
	addi $t0, $t0, 1		# increment counter
        sw $t1, PrintINT                # store integer for print
	lb $a0, PrintINT    		# load the current number to print
        li $v0, 1         		# system call code for print integer
        syscall
	la $a0, space     		# load address of space
        li $v0, 4         		# system call code for print string
        syscall

increment_number:
        addi $t1, $t1, 1  		# increment number
        j check_numbers


Item8:
	
#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#

#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 3 lines each with 5 integers (with spaces between the integers)
# This must be implemented using a nested loop.
#
        li $t0, 0         		# counter
	li $t1, 1			# number
	li $t4, 0			# counter for number in line
        li $t6, 7                       # constant as 7
        li $t7, 13                      # constant as 13

check_numbers8:
        bge $t0, 15, Exit  		# if printed 15 numbers, exit loop
        div $t1, $t6        		# check if divisible by 7
        mfhi $t3          		# remainder in $t3
        beq $t3,0, print_number8  	# if divisible by 7, print the number
        div $t1, $t7       		# check if divisible by 13
        mfhi $t3          		# remainder in $t1
        beq $t3,0, print_number8  	# if divisible by 13, print the number
        j increment_number8		# skip print if not divisible by both 7 and 13

print_number8:
	addi $t0, $t0, 1		# increment counter
	addi $t4, $t4, 1		# increment counter for 1 line
        sw $t1, PrintINT                # store integer for print
	lb $a0, PrintINT    		# load the current number to print
        li $v0, 1         		# system call code for print integer
        syscall
	la $a0, space     		# load address of space
        li $v0, 4         		# system call code for print string
        syscall
        bne $t4, 5, increment_number8	# skip to next number if not reaching 5 numbers per line yet

	li $t4, 0			# reset counter for number in line
        la	$a0,Enter		# address of string to print
        li	$v0,4			# system call code for print_str
        syscall                 	# print the string

increment_number8:
        addi $t1, $t1, 1  		# increment number
        j check_numbers8


Exit:
	jr $ra
