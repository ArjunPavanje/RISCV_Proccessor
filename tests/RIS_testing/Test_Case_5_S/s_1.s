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

# li x5, 0x00001030
lui x5, 1
addi x5, x5, 48

sh x1, 0(x5)
sh x2, 2(x5)
sh x3, 4(x5)
sh x4, 6(x5)

# li x5, 0x00001038
lui x5, 1
addi x5, x5, 56

sb x1, 0(x5)
sb x2, 1(x5)
sb x3, 2(x5)
sb x4, 3(x5)

# Initialize base address pointer to 0x0000
lui x31, 0x0          # x31 = base address 0x0000

# Store x1-x20 sequentially in memory
sd x1, 0(x31)         # Store x1 at address 0x0000
sd x2, 4(x31)         # Store x2 at address 0x0004
sd x3, 8(x31)         # Store x3 at address 0x0008
sd x4, 12(x31)        # Store x4 at address 0x000C
sd x5, 16(x31)        # Store x5 at address 0x0010
sd x6, 20(x31)        # Store x6 at address 0x0014
sd x7, 24(x31)        # Store x7 at address 0x0018
sd x8, 28(x31)        # Store x8 at address 0x001C
sd x9, 32(x31)        # Store x9 at address 0x0020
sd x10, 36(x31)       # Store x10 at address 0x0024
sd x11, 40(x31)       # Store x11 at address 0x0028
sd x12, 44(x31)       # Store x12 at address 0x002C
sd x13, 48(x31)       # Store x13 at address 0x0030
sd x14, 52(x31)       # Store x14 at address 0x0034
sd x15, 56(x31)       # Store x15 at address 0x0038
sd x16, 60(x31)       # Store x16 at address 0x003C
sd x17, 64(x31)       # Store x17 at address 0x0040
sd x18, 68(x31)       # Store x18 at address 0x0044
sd x19, 72(x31)       # Store x19 at address 0x0048
sd x20, 76(x31)       # Store x20 at address 0x004C


end:
    jal x0, end