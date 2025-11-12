# Factorial
add t0, x0, x0
add t1, x0, x0
add a0, x0, x0
add sp, x0, x0

addi t0, t0, 2

sd t0, 0(sp)
addi sp, sp, 8

add a0, t0, x0
jal ra, Factorial

ld t0, 0(sp)
addi sp, sp, -8

Forever: jal x0, Forever

Factorial:
    bge x0, a0, Return1

    sd a0, 0(sp)
    sd ra, 8(sp)
    sd t0, 16(sp)
    addi sp, sp, 24

    addi a0, a0, -1

    jal ra, Factorial
    add t1, a0, x0
    
    addi sp, sp, -24
    ld a0, 0(sp)
    ld ra, 8(sp)
    ld t0, 16(sp)

    mul t0, t0, t1
    
    add a0, t0, x0
    jalr x0, 0(ra)

    Return1: addi a0, x0, 1
    jalr x0, 0(ra)