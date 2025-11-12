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

fmin.s f6, f1, f2   # min(123.5, 3.14159)
fmax.s f9, f1, f2   # max(123.5, 3.14159)
fmin.s f7, f3, f4   # min(39.0, -11.795)
fmax.s f10, f3, f4  # max(39.0, -11.795)
fmin.s f8, f4, f5   # min(-11.795, -41)
fmax.s f11, f4, f5  # max(-11.795, -41)

end:
    jal x0, end
