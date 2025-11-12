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

feq.s x1, f1, f2    # equal (NaN, +Infinity)
feq.s x2, f2, f3    # equal (+Infinity, -Infinity)
feq.s x3, f1, f4    # equal (NaN, NaN)
feq.s x4, f1, f5    # equal (NaN, 39.0)

flt.s x5, f1, f2    # less (NaN, +Infinity)
flt.s x6, f2, f3    # less (+Infinity, -Infinity)
flt.s x7, f5, f2    # less (39.0, +Infinity)
flt.s x8, f1, f4    # less (NaN, NaN)

flt.s x9, f1, f2    # less_eq (NaN, +Infinity)
flt.s x10, f2, f3   # less_eq (+Infinity, -Infinity)
flt.s x11, f5, f2   # less_eq (39.0, +Infinity)
flt.s x12, f1, f4   # less_eq (NaN, NaN)

end:
    jal x0, end