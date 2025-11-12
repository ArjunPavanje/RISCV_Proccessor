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

fmin.s f6,  f1, f2   # min(NaN, +Infinity)
fmin.s f7,  f1, f3   # min(NaN, -Infinity)
fmin.s f8,  f2, f3   # min(+Infinity, -Infinity)
fmin.s f9,  f1, f5   # min(NaN, 39.0)
fmin.s f10, f2, f4   # min(+Infinity, +0)
fmin.s f11, f3, f5   # min(-Infinity, 39.0)

fmax.s f12, f1, f2   # max(NaN, +Infinity)
fmax.s f13, f1, f3   # max(NaN, -Infinity)
fmax.s f14, f2, f3   # max(+Infinity, -Infinity)
fmax.s f15, f1, f5   # max(NaN, 39.0)
fmax.s f16, f2, f4   # max(+Infinity, +0)
fmax.s f17, f3, f5   # max(-Infinity, 39.0)

end:
    jal x0, end