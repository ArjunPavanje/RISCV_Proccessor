
li x1, 0x1000
addi x2, x0, 137
sd x2, 0(x1)
addi x0, x0, 0
addi x3, x0, 27
ld x4, 0(x1)
add x5, x4, x3

end:
    jal x0, end