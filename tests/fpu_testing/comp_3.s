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

feq.s x1, f1, f2    # equal (123.5, 3.14159)
feq.s x2, f2, f2    # equal (3.14159, 3.14159)
feq.s x3, f3, f4    # equal (39.0, -11.795)
feq.s x4, f5, f5    # equal (-41, -41)

flt.s x5, f1, f2    # less (123.5, 3.14159)
flt.s x6, f4, f5    # less (-11.795, -41)
flt.s x7, f3, f5    # less (39.0, -41)
flt.s x8, f3, f3    # less (39.0, 39.0)

fle.s x9, f1, f2    # less_eq (123.5, 3.14159)
fle.s x10, f4, f5   # less_eq (-11.795, -41)
fle.s x11, f4, f5   # less_eq (39.0, -41)
fle.s x12, f3, f3   # less_eq (39.0, 39.0)


end: 
    jal x0, end