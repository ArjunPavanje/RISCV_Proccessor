# 123.5
li x1, 0x42f70000

# 3.14159
li x2, 0x40490fd0

# 39.0
li x3, 0x421c0000

# -11.795
li x4, 0xc13cb85
slli x4, x4, 4
addi x4, x4, 0x2

# -41
li x5, 0xc224000
slli x5, x5, 4

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5

fadd.s f6,  f1, f2    # add (123.5, 3.14159)
fadd.s f7,  f3, f4    # add (39.0, -11.795)
fadd.s f8,  f4, f5    # add (-11.795, -41)
fadd.s f9,  f2, f3    # add (3.14159, 39.0)

fsub.s f10,  f1, f2    # sub (123.5, 3.14159)
fsub.s f11,  f3, f4    # sub (39.0, -11.795)
fsub.s f12,  f4, f5    # sub (-11.795, -41)
fsub.s f13,  f2, f3   # sub (3.14159, f34)


end:
    jal x0, end