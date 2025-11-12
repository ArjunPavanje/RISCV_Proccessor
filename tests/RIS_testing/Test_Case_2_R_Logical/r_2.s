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

# Logical 

and x5, x1, x2              # bitwise AND: (-2147483648) & (2147483647) = 0
and x6, x3, x4              # bitwise AND: (218937) & (793240123) = 218937
and x7, x0, x4              # bitwise AND: (0) & (793240123) = 0
and x8, x1, x3              # bitwise AND: (-2147483648) & (218937) = 0

or x9, x1, x2               # bitwise OR: (-2147483648) | (2147483647) = -1
or x10, x3, x4              # bitwise OR: (218937) | (793240123) = 793459123
or x11, x0, x4              # bitwise OR: (0) | (793240123) = 793240123
or x12, x1, x3              # bitwise OR: (-2147483648) | (218937) = -2147264711

xor x13, x1, x2             # bitwise XOR: (-2147483648) ^ (2147483647) = -1
xor x14, x3, x4             # bitwise XOR: (218937) ^ (793240123) = 793240122
xor x15, x0, x4             # bitwise XOR: (0) ^ (793240123) = 793240123
xor x16, x1, x3             # bitwise XOR: (-2147483648) ^ (218937) = -2147264711

end:
    jal x0, end
