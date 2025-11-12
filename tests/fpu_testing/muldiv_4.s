.section .text

# NaN
li x1, 0x7fc00000

# +Infinity
li x2, 0x7f800000

# -Infinity
li x3, 0xff80000
slli x3, x3, 4

# +0
li x4, 0x00000000

# 39.0
li x5, 0x421c0000

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5

fmul.s f6, f1, f5       # multiply (NaN × 39.0)
fmul.s f7, f2, f3       # multiply (+Infinity × -Infinity)
fmul.s f8, f2, f5       # multiply (+Infinity × 39.0)

fdiv.s f9, f1, f5       # divide (NaN ÷ 39.0)
fdiv.s f10, f4, f4      # divide (0 ÷ 0)
fdiv.s f11, f4, f2      # divide (0 ÷ +Infinity)
fdiv.s f12, f5, f4      # divide (39.0 ÷ 0)
fdiv.s f13, f5, f2      # divide (39.0 ÷ +Infinity) 

end:
    jal x0, end