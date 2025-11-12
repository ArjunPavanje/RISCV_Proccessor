.section .text

# 123.5 
li x1, 0x405ee000 
slli x1, x1, 16
slli x1, x1, 16

# 3.14159
li x2, 0x400921f9; 
slli x2, x2, 16
slli x2, x2, 16
lui t1, 0xf01b8
addi t1, t1, 0x66e
add x2, x2, t1;

# 39.0
li x3, 0x40438000
slli x3, x3, 16
slli x3, x3, 16
add x3, x3, t1

# -11.795
lui x4, 0xc0279
addi x4, x4, 0x70a
slli x4, x4, 16
slli x4, x4, 16
lui t1, 0x3d70a
addi t1, t1, 0x3d7
add x4, x4, t1

# -41
lui x5, 0xc0448
slli x5, x5, 16
slli x5, x5, 16

fmv.d.x f1, x1
fmv.d.x f2, x2
fmv.d.x f3, x3
fmv.d.x f4, x4
fmv.d.x f5, x5

fadd.d f6,  f1, f2    # add (123.5, 3.14159)
fadd.d f7,  f3, f4    # add (39.0, -11.795)
fadd.d f8,  f4, f5    # add (-11.795, -41)
fadd.d f9,  f2, f3    # add (3.14159, 39.0)

fsub.d f10,  f1, f2    # sub (123.5, 3.14159)
fsub.d f11,  f3, f4    # sub (39.0, -11.795)
fsub.d f12,  f4, f5    # sub (-11.795, -41)
fsub.d f13,  f2, f3   # sub (3.14159, f34)


end:
    jal x0, end