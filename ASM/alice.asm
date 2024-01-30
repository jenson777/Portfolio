.data

f: .space 4
g: .space 4
h: .space 4

ans1: .space 4
ans2: .space 4
ans3: .space 4
name: .space 30

prompt_name: .asciiz "Enter your name: "
prompt_int: .asciiz "Enter a number from 1-100: "
hello: .asciiz"Hello"
read_int: .asciiz "Thank you for entering  "
prompt_result: "I calculated your results to be "
space: .asciiz " "
newline: .asciiz "\n"

.text
#prompt user for name

li $v0, 4
la $a0, prompt_name
syscall

li $v0, 8
la $a0, name
li $a1, 30

move $t0, $a0
syscall

#read 3 input from user



li $v0, 4
la $a0, prompt_int
syscall

li $v0, 5
syscall
sw $v0, f

li $v0, 4
la $a0, prompt_int
syscall
li $v0, 5
syscall
sw $v0, g

li $v0, 4
la $a0, prompt_int
syscall

li $v0, 5
syscall
sw $v0, h

#loading to temporary variables

lw $t0, f
lw $t1, g
lw $t2, h

li $v0,4
la $a0,newline
syscall

li $v0, 4
la $a0, hello
syscall

li $v0,4
la $a0,space
syscall

li $v0,4
la $a0,name
syscall

li $v0, 4
la $a0, read_int
syscall

li $v0, 1
lw $a0, f
syscall

li $v0, 4
la $a0, space
syscall

li $v0, 1
lw $a0, g
syscall

li $v0, 4
la $a0, space
syscall

li $v0, 1
lw $a0, h
syscall

li $v0, 4
la $a0, space
syscall

#calculate ans1
add $s0, $t0,$t0
add $s0,$s0,$t0
sub $s0,$s0,$t1
addi $s0,$s0,2

sw $s0, ans1

#calculating ans2
add $s0,$t1,$t1
add $s0,$s0,$t2
add $s0,$s0,$t0
subi $s0,$s0,3

sw $s0,ans2

#calculating ans2
addi $t0,$t0,6
addi $t1,$t1,15
subi $t2,$t2,4
add $s0,$t0,$t1
add $s0,$s0,$t2

sw $s0,ans3

li $v0, 4
la $a0, newline
syscall

#print prompt for result

li $v0, 4
la $a0, prompt_result
syscall

#print answers and space

li $v0, 1
lw $a0, ans1
syscall

li $v0, 4
la $a0, space
syscall

li $v0, 1
lw $a0, ans2
syscall

li $v0, 4
la $a0, space

syscall
li $v0, 1
lw $a0, ans3

syscall

