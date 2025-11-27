# Max Negative
# li x1, 0x8000000
lui x1, 32768

slli x1, x1, 20
slli x1, x1, 16

# Max Positive
# li x2, 0x7ffffff
lui x2, 32768
addi x2, x2, -1

slli x2, x2, 4
addi x2, x2, 0xf
# li x31, 0xfffffff
lui x31, 65536
addi x31, x31, -1

slli x31, x31, 4
addi x31, x31, 0x0f
slli x2, x2, 16
slli x2, x2, 16
add x2, x2, x31

# 218937
# li x3, 0x0035739
lui x3, 53
addi x3, x3, 1849

# 793240123
# li x4, 0x2F47E23B
lui x4, 193662
addi x4, x4, 571

# li x5, 0x00001000
lui x5, 1

sd x1, 0(x5)
sd x2, 8(x5)
sd x3, 16(x5)
sd x4, 24(x5)

# li x5, 0x00001020
lui x5, 1
addi x5, x5, 32

sw x1, 0(x5)
sw x2, 4(x5)
sw x3, 8(x5)
sw x4, 12(x5)

li x5, 0x00001030

sh x1, 0(x5)
sh x2, 2(x5)
sh x3, 4(x5)
sh x4, 6(x5)

li x5, 0x00001038

sb x1, 0(x5)
sb x2, 1(x5)
sb x3, 2(x5)
sb x4, 3(x5)



end:
    jal x0, end