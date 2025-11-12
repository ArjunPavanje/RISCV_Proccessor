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

feq.d x1, f1, f2    # equal (123.5, 3.14159)
feq.d x2, f2, f2    # equal (3.14159, 3.14159)
feq.d x3, f3, f4    # equal (39.0, -11.795)
feq.d x4, f5, f5    # equal (-41, -41)

flt.d x5, f1, f2    # less (123.5, 3.14159)
flt.d x6, f4, f5    # less (-11.795, -41)
flt.d x7, f3, f5    # less (39.0, -41)
flt.d x8, f3, f3    # less (39.0, 39.0)

fle.d x9, f1, f2    # less_eq (123.5, 3.14159)
fle.d x10, f4, f5   # less_eq (-11.795, -41)
fle.d x11, f4, f5   # less_eq (39.0, -41)
fle.d x12, f3, f3   # less_eq (39.0, 39.0)


end: 
    jal x0, end


