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

fadd.s f6,  f1, f2    # add (NaN, +Infinity)
fadd.s f7,  f2, f3    # add (+Infinity, -Infinity)
fadd.s f8,  f2, f5    # add (+Infinity, 39.0)
fadd.s f9,  f3, f5    # add (-Infinity, 39.0)

fsub.s f10, f1, f2    # sub (NaN, +Infinity)
fsub.s f11, f2, f3    # sub (+Infinity, -Infinity)
fsub.s f12, f2, f5    # sub (+Infinity, 39.0)
fsub.s f13, f3, f5    # sub (-Infinity, 39.0)

end:
    jal x0, end