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


# -41
lui x5, 0xc0448
slli x5, x5, 16
slli x5, x5, 16

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5


fcvt.s.d f6, f1
fcvt.s.d f7, f2
fcvt.s.d f8, f3
fcvt.s.d f9, f4
fcvt.s.d f10, f5

end:
    jal x0, end