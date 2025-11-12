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

# Shift 

sll x5, x1, x2              # shift left: (-2147483648) << (2147483647)
sll x6, x3, x4              # shift left: (218937) << (793240123)
sll x7, x0, x4              # shift left: (0) << (793240123)
sll x8, x1, x3              # shift left: (-2147483648) << (218937)

srl x9, x1, x2              # logical right shift: (-2147483648) >> (2147483647)
srl x10, x3, x4             # logical right shift: (218937) >> (793240123)
srl x11, x0, x4             # logical right shift: (0) >> (793240123)
srl x12, x1, x3             # logical right shift: (-2147483648) >> (218937)

sra x13, x1, x2             # arithmetic right shift: (-2147483648) >> (2147483647)
sra x14, x3, x4             # arithmetic right shift: (218937) >> (793240123)
sra x15, x0, x4             # arithmetic right shift: (0) >> (793240123)
sra x16, x1, x3             # arithmetic right shift: (-2147483648) >> (218937)

end:
    jal x0, end

