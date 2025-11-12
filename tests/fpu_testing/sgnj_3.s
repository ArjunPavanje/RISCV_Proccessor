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

fsgnj.s f6,  f1, f5    # sign_inject (123.5, -41)
fsgnj.s f7,  f1, f2    # sign_inject (123.5, 3.14159)
fsgnj.s f8,  f4, f5    # sign_inject (-11.795, -41)

fsgnjn.s f9,  f2, f5   # sign_invert (3.14159, -41)
fsgnjn.s f10, f2, f3   # sign_invert (3.14159, 39.0)
fsgnjn.s f11, f4, f5   # sign_invert (-11.795, -41)

fsgnjx.s f12, f3, f4   # sign_xor (39.0, -11.795)
fsgnjx.s f13, f1, f3   # sign_xor (123.5, 39.0)
fsgnjx.s f14, f5, f4   # sign_xor (-41, -11.795)


end:
    jal x0, end