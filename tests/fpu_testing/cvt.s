# 123
addi x1, x0, 123

# 0
addi x2, x0, 0

# Maximum Positive
li x3, 0x7FFFFFF
slli x3, x3, 4
addi x3, x3, 0xF

# Maximum Negative 
li x4, 0xFFFFFFF
slli x4, x4, 4
addi x4, x4, 0xF

# -41
addi x5, x0, -41

fcvt.s.w f1, x1
fcvt.s.w f2, x2
fcvt.s.w f3, x3
fcvt.s.w f4, x4
fcvt.s.w f5, x5

end:
    jal x0, end