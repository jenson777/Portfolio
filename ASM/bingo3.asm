.data
BingoArray: .word -31, -30, -29, -28, -27, -26, -25, -24, -23, -22, -21, -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
BingoArraySize: .word 64
newline: .asciiz "\n"
.eqv SysRandIntRange 42 
.text
main:
#-------------------------------------------------------
    
    # Display the 64 bingo calls
    li $t3, 0                # initialize loop counter to 0
    li $t4, 64               # iterate 64 times----------------------------------------

display_loop:
    bge $t3, $t4, end_display # exit loop after all iterations

    # Print the next bingo call
    la $t0, BingoArray
    lw $t1, ($t0)            # load bingo number at index $t3
    add $t1, $t1, $t3        # adjust for array index
    li $v0, 1                # syscall code for print integer
    move $a0, $t1            # load bingo number to be printed
    syscall

    # Print newline
    li $v0, 4                # syscall code for print string
    la $a0, newline           # load newline string address
    syscall

    addi $t3, $t3, 1         # increment loop counter

    j display_loop

end_display:

    # Exit program
    li $v0, 10               # syscall code for exit
    syscall



    jr $ra                   # return to calling function