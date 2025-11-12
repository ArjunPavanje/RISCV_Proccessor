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

end:
    jal x0, end

  