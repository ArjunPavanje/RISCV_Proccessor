# Max Negative
li x1, 0x8000000
slli x1, x1, 20
slli x1, x1, 16

# Max Positive
li x2, 0x7ffffff
slli x2, x2, 4
addi x2, x2, 0xf
li x31, 0xfffffff
slli x31, x31, 4
addi x31, x31, 0x0f
slli x2, x2, 16
slli x2, x2, 16
add x2, x2, x31

# 218937
li x3, 0x0035739

# 793240123
li x4, 0x2F47E23B

li x5, 0x00001000

sd x1, 0(x5)
sd x2, 8(x5)
sd x3, 16(x5)
sd x4, 24(x5)

li x5, 0x00001020

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