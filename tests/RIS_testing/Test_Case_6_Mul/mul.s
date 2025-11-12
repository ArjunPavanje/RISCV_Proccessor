.section .text


# x7 = 0x10000000, x8 = 0x10000008
#lui x28, 0x10000
#ld x7, 0(x28)
#ld x8, 8(x28)

# 128 
addi x7, x0, 128
# 729 
addi x8, x0, 729

# Initializing vaariables
addi x9, x0, 0 # Product
addi x5, x0, 0 # Exponent of 2
addi x6, x0, 1 # For checking i^th bit's value 

# Keeping the positive operand (if exists) as x8
# This is to minimize computations
blt x8, x0, neg1

# iF this executes it means that both numbers are positive
# It is beneficial if the smaller number is in x8 (shifts of higher order are avoided)
blt x7, x8, pos2

# Means atleast 1 number is negative
neg1: 
    # Checking if 2nd number is negative
    blt x7, x0, neg2

    # x7 is positive, so swap x7, x8 
    add x11, x8, x0 # Storing old x8's negative value
    add x8, x7, x0 # x8 is now positive
    add x7, x11, x0 # what was in x8 is now in x7
    jal x0, Loop


# Both numbers are negative 
neg2:
    li x11, -1
    addi x1, x0, 1

    # Negating x7, x8 (turning both into positive numbers)    
    xor x7, x7, x11 
    add x7, x7, x1
    xor x8, x8, x11 
    add x8, x8, x1
    jal x0, Loop

# Currently x7 has the smaller number so we swap them
pos2:
    add x11, x8, x0 # Storing x8's old value
    add x8, x7, x0 # x8 is now smaller
    add x7, x11, x0 # what was in x8 is now in x7
    jal x0, Loop

pos1: # i^th bit is 1 
    # performing  (x9)=(x7)*(2^(x5))
    sll x11, x7, x5 
    add x9, x9, x11

    # If product exceeds 64 bits (i.e. wrap around happens) cut it off

    # Modifying loop variables
    slli x6, x6, 1
    addi x5, x5, 1

    bne x6, x0, Loop


Loop:
    # Checking if i^th bit of x8 is 1 
    and x10, x8, x6 # Getting i^th bit of x8
    bne x10, x0, pos1 # Branching
    
    # Modifying loop variables
    slli x6, x6, 1
    addi x5, x5, 1

    bne x6, x0, Loop
end:
    jal x0, end