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

fadd.d f6,  f1, f2    # add (NaN, +Infinity)
fadd.d f7,  f2, f3    # add (+Infinity, -Infinity)
fadd.d f8,  f2, f5    # add (+Infinity, 39.0)
fadd.d f9,  f3, f5    # add (-Infinity, 39.0)

fsub.d f10, f1, f2    # sub (NaN, +Infinity)
fsub.d f11, f2, f3    # sub (+Infinity, -Infinity)
fsub.d f12, f2, f5    # sub (+Infinity, 39.0)
fsub.d f13, f3, f5    # sub (-Infinity, 39.0)

end:
    jal x0, end