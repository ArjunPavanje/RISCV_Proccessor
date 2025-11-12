.section .text

# NaN
lui x1, 0x7ff80
slli x1, x1, 16
slli x1, x1, 16

# +Infinity
lui x2, 0x7ff00
slli x2, x2, 16
slli x2, x2, 16

# -Infinity
lui x3, 0xfff00
slli x3, x3, 16
slli x3, x3, 16

# +0
lui x4, 0x00000
slli x4, x4, 16
slli x4, x4, 16

# 39.0
li x5, 0x40438000
slli x5, x5, 16
slli x5, x5, 16

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5

fmul.d f6, f1, f5       # multiply (NaN × 39.0)
fmul.d f7, f2, f3       # multiply (+Infinity × -Infinity)
fmul.d f8, f2, f5       # multiply (+Infinity × 39.0)

fdiv.d f9, f1, f5       # divide (NaN ÷ 39.0)
fdiv.d f10, f4, f4      # divide (0 ÷ 0)
fdiv.d f11, f4, f2      # divide (0 ÷ +Infinity)
fdiv.d f12, f5, f4      # divide (39.0 ÷ 0)
fdiv.d f13, f5, f2      # divide (39.0 ÷ +Infinity) 

end:
    jal x0, end