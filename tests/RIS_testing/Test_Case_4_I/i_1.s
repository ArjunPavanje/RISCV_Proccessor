
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

# Immediete 

addi x5, x1, 123         # (-2147483648) + 123 = -2147483525
addi x6, x1, -12         # (-2147483648) + (-12) = -2147483660
addi x7, x3, 67          # (218937) + 67 = 219004
addi x8, x4, -98         # (793240123) + (-98) = 793240025

ori x9, x1, 12           # (-2147483648) | 12 = -2147483636
ori x10, x3, -34         # (218937) | (-34) = -33
andi x11, x0, -314       # (0) & (-314) = 0
andi x12, x1, 39         # (-2147483648) & 39 = 0

xori x13, x1, 234        # (-2147483648) ^ 234 = -2147483414
xori x14, x3, -419       # (218937) ^ (-419) = -219302
slli x15, x0, 16         # (0) << 16 = 0
slli x16, x2, 4          # (-2147483648) << 4 = 0 (overflow masked in 32-bit)

srai x17, x1, 16         # (-2147483648) >> 16 (arith) = 32767
srai x18, x1, 4          # (-2147483648) >> 4 (arith) = 134217727
srli x19, x1, 16         # (-2147483648) >> 16 (logical) = 32767
srli x20, x1, 4          # (-2147483648) >> 4 (logical) = 134217727

end:
    jal x0, end