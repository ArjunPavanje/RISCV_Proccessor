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

# NaN
lui x4, 0x7ff88
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

feq.d x1, f1, f2    # equal (NaN, +Infinity)
feq.d x2, f2, f3    # equal (+Infinity, -Infinity)
feq.d x3, f1, f4    # equal (NaN, NaN)
feq.d x4, f1, f5    # equal (NaN, 39.0)

flt.d x5, f1, f2    # less (NaN, +Infinity)
flt.d x6, f2, f3    # less (+Infinity, -Infinity)
flt.d x7, f5, f2    # less (39.0, +Infinity)
flt.d x8, f1, f4    # less (NaN, NaN)

flt.d x9, f1, f2    # less_eq (NaN, +Infinity)
flt.d x10, f2, f3   # less_eq (+Infinity, -Infinity)
flt.d x11, f5, f2   # less_eq (39.0, +Infinity)
flt.d x12, f1, f4   # less_eq (NaN, NaN)

end:
    jal x0, end