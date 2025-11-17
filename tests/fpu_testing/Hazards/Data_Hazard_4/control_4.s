li x1, 0x1000

addi x2, x0, 10
addi x3, x0, 11
sd x3, 0(x1)
addi x4, x0, 71
ld x5, 0(x1)
add x6, x5, x2
add x7, x6, x5

end:
    jal x0, end